import 'package:flutter/material.dart';

class AdaptiveSingleChildScrollView extends StatelessWidget {
  final Widget topChild;
  final Widget bottomChild;
  final EdgeInsetsGeometry padding;

  const AdaptiveSingleChildScrollView({
    required this.topChild,
    required this.bottomChild,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, viewportConstraints) {
        return SingleChildScrollView(
          padding: padding,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth - padding.horizontal,
              minHeight: viewportConstraints.maxHeight - padding.vertical,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                topChild,
                bottomChild,
              ],
            ),
          ),
        );
      },
    );
  }
}
