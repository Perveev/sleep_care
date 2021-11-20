import 'package:flutter/material.dart';

import '../../common/resource/palette.dart';

class ModalProgressIndicator extends StatelessWidget {
  static const _defaultOpacity = 0.5;

  final bool progress;
  final Widget indicator;
  final Color backgroundColor;
  final double backgroundOpacity;

  const ModalProgressIndicator({
    required this.progress,
    this.indicator = const CircularProgressIndicator(color: Palette.pumpkin),
    this.backgroundColor = Palette.greySuit,
    this.backgroundOpacity = _defaultOpacity,
  });

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    if (progress) {
      final modal = [
        Opacity(
          child: ModalBarrier(
            dismissible: false,
            color: backgroundColor,
          ),
          opacity: backgroundOpacity,
        ),
        Center(child: indicator),
      ];
      widgets.addAll(modal);
    }
    return Stack(children: widgets);
  }
}
