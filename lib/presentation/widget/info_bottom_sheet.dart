import 'package:flutter/material.dart';

import '../../common/resource/styles.dart';
import '../../presentation/widget/base_bottom_sheet.dart';
import 'border_action_button.dart';
import 'rounded_button.dart';

class InfoBottomSheet extends StatelessWidget {
  final String message;
  final String description;
  final String? positiveButtonText;
  final void Function()? onPositiveButtonTap;
  final String? negativeButtonText;
  final void Function()? onNegativeButtonTap;

  const InfoBottomSheet(
    this.message, {
    this.description = '',
    this.positiveButtonText,
    this.onPositiveButtonTap,
    this.negativeButtonText,
    this.onNegativeButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    return BaseBottomSheet(
      child: Padding(
        padding: EdgeInsets.fromLTRB(24.0, 40.0, 24.0, bottomPadding + 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Styles.s18CharcoalW600,
              textAlign: TextAlign.center,
            ),
            if (description.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  description,
                  style: Styles.s16CharcoalW400,
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 48.0),
            RoundedButton(
              text: positiveButtonText ??
                  ''
                      'ok(add translate)',
              onTap: onPositiveButtonTap ?? () => Navigator.pop(context),
            ),
            if (negativeButtonText?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: BorderActionButton(
                  text: negativeButtonText!,
                  onTap: onNegativeButtonTap ?? () => Navigator.pop(context),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
