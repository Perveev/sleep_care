import 'package:flutter/material.dart';

import '../../../common/resource/palette.dart';
import '../../../common/resource/styles.dart';

class BorderActionButton extends StatelessWidget {
  static const double borderWidth = 4.0;
  final String text;
  final Color? color;
  final Color? borderColor;
  final Color? rippleColor;
  final TextStyle? style;
  final void Function()? onTap;

  const BorderActionButton({
    required this.text,
    this.color,
    this.borderColor,
    this.rippleColor,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: borderWidth,
            color: borderColor ?? Palette.bondiBlue,
          ),
          primary: color ?? Palette.white,
          onPrimary: rippleColor ?? Palette.cobalt,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
          ),
          minimumSize: const Size.fromHeight(80.0),
        ),
        child: Text(
          text.toUpperCase(),
          style: style ?? Styles.s14BondiBlueW600,
        ),
      ),
    );
  }
}
