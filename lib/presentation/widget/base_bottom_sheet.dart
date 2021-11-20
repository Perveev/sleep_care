import 'package:flutter/material.dart';

import '/common/resource/palette.dart';

class BaseBottomSheet extends StatelessWidget {
  final Widget child;

  const BaseBottomSheet({required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: child,
    );
  }
}
