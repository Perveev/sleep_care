import 'package:flutter/material.dart';

import '/common/resource/palette.dart';

class SmoothPageIndicator extends StatefulWidget {
  final int count;
  final int currentPage;

  const SmoothPageIndicator({required this.count, required this.currentPage});

  @override
  _SmoothPageIndicatorState createState() => _SmoothPageIndicatorState();
}

class _SmoothPageIndicatorState extends State<SmoothPageIndicator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(),
    );
  }

  List<Widget> _buildPageIndicator() {
    final list = <Widget>[];
    for (var i = 0; i < widget.count; i++) {
      list.add(i == widget.currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  AnimatedContainer _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(
        horizontal: 3.5,
        vertical: 8.0,
      ),
      height: isActive ? 5.0 : 3.0,
      width: isActive ? 12.0 : 3.0,
      decoration: BoxDecoration(
        color: Palette.bondiBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
