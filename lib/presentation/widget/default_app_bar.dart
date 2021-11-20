import 'package:flutter/material.dart';

import '/common/resource/styles.dart';
import '/common/util/dimension_manager.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final GestureTapCallback? onLeadingTap;
  final List<Widget>? actions;
  final Widget? body;
  final double height;
  final Color backgroundColor;

  const DefaultAppBar({
    this.title = '',
    this.titleStyle,
    this.leading,
    this.onLeadingTap,
    this.actions,
    this.body,
    this.height = 80,
    this.backgroundColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: DimensionManager.getTopPadding(context),
        right: 16.0,
        left: 16.0,
      ),
      color: backgroundColor,
      child: body ??
          Stack(
            children: [
              if (leading != null)
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: leading,
                    onTap: onLeadingTap ?? () => Navigator.pop(context),
                  ),
                ),
              if (title.isNotEmpty)
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24.0,
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: titleStyle ?? Styles.s16WhiteW400,
                    ),
                  ),
                ),
              if (actions != null)
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  ),
                ),
            ],
          ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
