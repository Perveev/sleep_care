import 'package:flutter/material.dart';

import '/../common/resource/styles.dart';
import 'border_action_button.dart';
import 'rounded_button.dart';

class DefaultDialog extends StatelessWidget {
  final String title;
  final String subTitle;
  final String topButtonText;
  final String bottomButtonText;
  final void Function() onTopButtonTap;
  final void Function() onBottomButtonTap;

  const DefaultDialog({
    required this.title,
    required this.subTitle,
    required this.topButtonText,
    required this.bottomButtonText,
    required this.onTopButtonTap,
    required this.onBottomButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
      contentPadding: const EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 24.0),
      actionsPadding:
          const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      title: Text(title, style: Styles.s24CharcoalW500),
      content: Text(subTitle, style: Styles.s14CharcoalW400),
      actions: <Widget>[
        BorderActionButton(text: topButtonText, onTap: onTopButtonTap),
        const SizedBox(height: 10.0),
        RoundedButton(text: bottomButtonText, onTap: onBottomButtonTap)
      ],
    );
  }
}
