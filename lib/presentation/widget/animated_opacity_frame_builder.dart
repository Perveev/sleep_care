import 'package:flutter/material.dart';

class AnimatedOpacityFrameBuilder extends StatelessWidget {
  final int? frame;
  final bool wasSynchronouslyLoaded;
  final Widget child;

  const AnimatedOpacityFrameBuilder({
    this.frame,
    required this.wasSynchronouslyLoaded,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (wasSynchronouslyLoaded) return child;
    return AnimatedOpacity(
      child: child,
      opacity: frame == null ? 0.0 : 1.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }
}
