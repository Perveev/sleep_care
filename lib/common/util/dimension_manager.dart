import 'package:flutter/material.dart';

class DimensionManager {
  DimensionManager._();

  static double getTopPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double getBottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
