import 'package:flutter/material.dart';

import '../../../common/resource/palette.dart';
import '../../../common/resource/styles.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final void Function()? onTap;
  final Color? color;
  final Color? rippleColor;

  const RoundedButton({
    required this.text,
    this.style,
    this.onTap,
    this.color,
    this.rippleColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: const Size.fromHeight(80.0),
        onPrimary: rippleColor ?? Palette.white,
      ).merge(
        ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) {
              final primary = color ?? Palette.bondiBlue;
              return states.contains(MaterialState.disabled)
                  ? primary.withOpacity(0.3)
                  : primary;
            },
          ),
        ),
      ),
      child: Text(
        text.toUpperCase(),
        style: style ?? Styles.s14WhiteW600,
      ),
    );
  }
}
