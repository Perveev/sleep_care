import 'package:flutter/material.dart';

class SelectionDialog extends StatelessWidget {
  final Widget topItem;
  final void Function() onTopItemTap;
  final Widget bottomItem;
  final void Function() onBottomItemTap;

  const SelectionDialog({
    required this.topItem,
    required this.onTopItemTap,
    required this.bottomItem,
    required this.onBottomItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      contentPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            title: topItem,
            onTap: () {
              onTopItemTap();
              Navigator.pop(context);
            },
          ),
          ListTile(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
            minVerticalPadding: 0.0,
            title: bottomItem,
            onTap: () {
              onBottomItemTap();
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
