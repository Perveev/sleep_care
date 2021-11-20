import 'package:flutter/material.dart';

import '../../common/resource/palette.dart';
import '../../common/resource/styles.dart';

class BaseRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T> onSelected;

  const BaseRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(value),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Palette.white,
          border: Border.all(color: Palette.gainsboro),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: Styles.s14CharcoalW500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            _radioIcon(groupValue == value),
          ],
        ),
      ),
    );
  }

  Widget _radioIcon(bool isSelected) {
    return Container(
      width: 24.0,
      height: 24.0,
      decoration: BoxDecoration(
        color: isSelected ? Palette.bondiBlue : Palette.whiteSmoke,
        shape: BoxShape.circle,
        border: isSelected ? null : Border.all(color: Palette.gainsboro),
      ),
    );
  }
}
