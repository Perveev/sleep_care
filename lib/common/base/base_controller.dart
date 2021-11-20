import 'dart:async';

import 'package:flutter/material.dart';

import '../util/internet_connection.dart';

abstract class BaseController
    with ChangeNotifier, InternetConnection, _ProgressHandler {
  void Function(dynamic)? _handleError;

  set errorHandler(void Function(dynamic) handleError) =>
      _handleError = handleError;

  Future<void> execute<T>(
    Future<T> action, {
    void Function(T result)? onSuccess,
    void Function(dynamic error)? onError,
    bool withProgress = true,
  }) async {
    if (await hasInternetConnection) {
      try {
        if (withProgress) showProgress();
        final result = await action;
        onSuccess?.call(result);
      } catch (e) {
        onError != null ? onError(e) : _handleError?.call(e);
      } finally {
        if (withProgress) hideProgress();
      }
    } else {
      _handleError?.call(TimeoutException('No Internet connection'));
    }
  }
}

mixin _ProgressHandler on ChangeNotifier {
  bool inProgress = false;

  void showProgress() {
    inProgress = true;
    notifyListeners();
  }

  void hideProgress() {
    inProgress = false;
    notifyListeners();
  }
}
