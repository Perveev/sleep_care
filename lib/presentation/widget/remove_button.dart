import 'package:flutter/material.dart';

import '../../common/resource/drawables.dart';
import '../../common/resource/palette.dart';

class RemoveWidget extends StatelessWidget {
  final void Function() onTap;

  const RemoveWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Drawables.getImage(Drawables.whiteCross),
      ),
    );
  }
}
