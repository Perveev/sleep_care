import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/base/base_controller.dart';
import '/common/resource/palette.dart';
import '/common/resource/strings.dart';
import '/presentation/widget/info_bottom_sheet.dart';
import '/presentation/widget/modal_progress_indicator.dart';

abstract class BaseLayout extends StatefulWidget {}

abstract class BaseLayoutState<C extends BaseController, L extends BaseLayout>
    extends State<L> {
  @protected
  late final C controller;
  @protected
  bool inSafeArea = true;
  @protected
  bool resizeToAvoidBottomInset = true;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>()..errorHandler = handleError;
    WidgetsBinding.instance?.addPostFrameCallback((_) => onInit());
  }

  @protected
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: Stack(
        children: [
          inSafeArea
              ? SafeArea(child: buildLayout(context))
              : buildLayout(context),
          ModalProgressIndicator(progress: controller.inProgress),
        ],
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget buildLayout(BuildContext context);

  @protected
  void handleError(dynamic error) {
    if (error is TimeoutException) {
      showInfoDialog(
        Strings.noInternetConnection,
        description: Strings.noInternetConnectionDescription,
      );
    } else {
      showInfoDialog(Strings.somethingWentWrong);
    }
  }

  @protected
  Future<void> showInfoDialog(String message, {String description = ''}) async {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Palette.transparent,
      builder: (_) => InfoBottomSheet(message, description: description),
    );
  }
}
