import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/common/base/base_controller.dart';
import 'base_layout.dart';

abstract class BaseScreen<C extends BaseController, L extends BaseLayout>
    extends StatelessWidget {
  @protected
  abstract final C controller;
  @protected
  abstract final L layout;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<C>(
      create: (_) => controller,
      child: Consumer<C>(builder: (_, __, ___) => layout),
    );
  }
}
