import 'package:flutter/material.dart';

import '../../../../../../common/extension/string_extension.dart';
import '../../common/resource/styles.dart';

class TitleTile extends StatelessWidget {
  final String title;
  final String? subTitle;

  const TitleTile({
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return subTitle.isNullOrEmpty
        ? const SizedBox.shrink()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Text(title, style: Styles.s13CharcoalW400),
              const SizedBox(height: 5.0),
              Text(subTitle!, style: Styles.s15CharcoalW600),
            ],
          );
  }
}
