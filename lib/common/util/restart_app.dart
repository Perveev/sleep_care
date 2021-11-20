import 'package:flutter/widgets.dart';

class RestartApp extends StatefulWidget {
  final Widget child;

  const RestartApp({required this.child});

  @override
  _RestartAppState createState() => _RestartAppState();

  static void rebirth(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppState>()?.restartApp();
  }
}

class _RestartAppState extends State<RestartApp> {
  Key _key = UniqueKey();

  void restartApp() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: widget.child,
    );
  }
}
