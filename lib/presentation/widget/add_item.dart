import 'package:flutter/material.dart';

import '../../common/resource/drawables.dart';
import '../../common/resource/styles.dart';

class AddItem extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool expanded;

  const AddItem({
    required this.label,
    this.onTap,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: expanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          Drawables.getImage(Drawables.orangeAdd),
          const SizedBox(
            width: 6.0,
          ),
          expanded ? Expanded(child: _buildText()) : _buildText(),
        ],
      ),
    );
  }

  Text _buildText() {
    return Text(
      label.toUpperCase(),
      style: Styles.s11PumpkinW600,
    );
  }
}
