import 'dart:io';

import 'package:dio/dio.dart';

class NetworkError extends Error {
  final String? baseUrl;
  final String? path;
  final String? message;
  final dynamic responseData;
  final int? statusCode;
  final Headers? responseHeaders;

  NetworkError({
    this.baseUrl,
    this.path,
    this.message,
    this.responseData,
    this.statusCode,
    this.responseHeaders,
  });

  factory NetworkError.create(DioError error) {
    if (error.error is SocketException) {
      return ConnectionError();
    } else if (error.response?.statusCode == HttpStatus.unauthorized) {
      return UnauthorizedError();
    } else if (error.error is List<dynamic>) {
      final errorData = error.error.first as Map<String, dynamic>;
      return RequestError(_RequestErrorData.fromMap(errorData), error.error);
    } else {
      final response = error.response;
      final request = error.requestOptions;
      return NetworkError(
        statusCode: response?.statusCode,
        responseHeaders: response?.headers,
        responseData: response?.data,
        baseUrl: request.baseUrl,
        path: request.path,
        message: error.message,
      );
    }
  }

  @override
  String toString() {
    return 'NetworkError{baseUrl: $baseUrl, path: $path, message: $message, responseData: $responseData, statusCode: $statusCode, responseHeaders: $responseHeaders}';
  }
}

class ConnectionError extends NetworkError {}

class UnauthorizedError extends NetworkError {}

class RequestError extends NetworkError {
  final _RequestErrorData _error;

  String? get category => _error.category;

  RequestError(
    this._error,
    dynamic responseData,
  ) : super(
          message: _error.message,
          path: _error.path?.first,
          responseData: responseData,
        );
}

class _RequestErrorData {
  static const _paramMessage = 'message';
  static const _paramCategory = 'category';
  static const _paramPath = 'path';

  final String message;
  final String? category;
  final List<String>? path;

  const _RequestErrorData._({
    required this.message,
    this.category,
    this.path,
  });

  factory _RequestErrorData.fromMap(Map<String, dynamic> data) {
    return _RequestErrorData._(
      message: data[_paramMessage] as String,
      category: data[_paramCategory] as String?,
      path: (data[_paramPath] as List<dynamic>?)?.cast<String>(),
    );
  }
}
