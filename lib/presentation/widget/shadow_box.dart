import 'package:flutter/material.dart';

import '/common/resource/drawables.dart';
import '/common/resource/palette.dart';
import '/common/util/dimension_manager.dart';
import '/presentation/widget/ripple_wrapper.dart';

class ShadowBox extends StatelessWidget {
  final void Function() onTap;
  final int count;
  final Color color;

  const ShadowBox({
    required this.onTap,
    required this.count,
    this.color = Palette.whiteSmoke,
  });

  @override
  Widget build(BuildContext context) {
    final gridSize = (DimensionManager.getWidth(context) - 24 * count) / 4.0;
    return RippleWrapper(
      rippleRadius: const BorderRadius.all(Radius.circular(16.0)),
      margin: const EdgeInsets.all(5.0),
      background: color,
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        height: gridSize,
        width: gridSize,
        child: Center(
          child: Drawables.getImage(Drawables.greyAdd),
        ),
      ),
    );
  }
}
