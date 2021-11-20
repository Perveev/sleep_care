import 'package:flutter/material.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/styles.dart';

class LifeStyleItem extends StatelessWidget {
  final String text;
  final bool isActive;

  const LifeStyleItem({
    Key? key,
    required this.text,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(color: Palette.mayaBlue),
        color: isActive ? Palette.mayaBlue : Palette.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Text(
          text,
          style: !isActive ? Styles.s18CharcoalW500 : Styles.s18WhiteW500,
        ),
      ),
    );
  }
}
