import 'package:flutter/material.dart';

import '../../common/resource/palette.dart';

class CardItem extends StatelessWidget {
  final Widget child;
  final void Function()? onTap;
  final Color? color;
  final bool withShadow;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;

  const CardItem({
    required this.child,
    this.withShadow = true,
    this.onTap,
    this.color,
    this.padding,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: color ?? Palette.white,
          boxShadow: withShadow
              ? const [
                  BoxShadow(
                    color: Palette.mako10,
                    spreadRadius: -8.0,
                    blurRadius: 6.0,
                    offset: Offset(0.0, 16.0),
                  ),
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: child),
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: trailing!,
              ),
          ],
        ),
      ),
    );
  }
}
