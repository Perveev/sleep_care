import 'package:flutter/material.dart';

import '../../common/resource/drawables.dart';
import '../../common/resource/palette.dart';
import '../../common/resource/styles.dart';

class OptionItem extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final TextStyle textStyle;
  final String? error;
  final Widget? trailing;

  const OptionItem({
    required this.onTap,
    required this.title,
    this.textStyle = Styles.s14CharcoalW500,
    this.error,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6.0),
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 20.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              color: Palette.white,
              border: Border.all(
                color: error != null ? Palette.venetianRed : Palette.gainsboro,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                trailing ?? Drawables.getImage(Drawables.arrowRight),
              ],
            ),
          ),
        ),
        if (error != null)
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 1.0,
            ),
            child: Text(
              error!,
              textAlign: TextAlign.left,
              style: Styles.s12VenetianRedW400,
            ),
          ),
      ],
    );
  }
}
