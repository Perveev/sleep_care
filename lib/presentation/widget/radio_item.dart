import 'package:flutter/material.dart';

import '../../common/resource/palette.dart';
import '../../common/resource/styles.dart';

class RadioItem<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final ValueChanged<T> onSelected;

  const RadioItem({
    required this.value,
    required this.groupValue,
    required this.onSelected,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _radioIcon(groupValue == value),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            title,
            style: Styles.s14CharcoalW400,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _radioIcon(bool isSelected) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        color: isSelected ? Palette.bondiBlue : Palette.whiteSmoke,
        shape: BoxShape.circle,
        border: isSelected ? null : Border.all(color: Palette.gainsboro),
      ),
    );
  }
}
