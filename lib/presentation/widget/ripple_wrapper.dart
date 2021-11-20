import 'package:flutter/material.dart';

import '/common/resource/palette.dart';

class RippleWrapper extends StatelessWidget {
  final Widget child;
  final GestureTapCallback? onTap;
  final EdgeInsets margin;
  final BorderRadius rippleRadius;
  final Color background;

  const RippleWrapper({
    required this.child,
    this.onTap,
    this.margin = EdgeInsets.zero,
    this.rippleRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.background = Palette.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Material(
        borderRadius: rippleRadius,
        color: background,
        child: InkWell(
          borderRadius: rippleRadius,
          child: child,
          onTap: onTap ?? () {},
        ),
      ),
    );
  }
}
