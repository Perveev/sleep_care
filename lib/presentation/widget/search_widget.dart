import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/resource/drawables.dart';
import '../../common/resource/styles.dart';

class SearchWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String? hintText;

  const SearchWidget({required this.onChanged, this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Styles.s14BlackW500,
      onChanged: onChanged,
      textCapitalization: TextCapitalization.sentences,
      decoration: Styles.roundInputBoxDecoration.copyWith(
        prefixIcon: Drawables.getImage(Drawables.search),
        hintText: hintText,
        hintStyle: Styles.s14SuvaGreyW500,
        border: InputBorder.none,
      ),
    );
  }
}
