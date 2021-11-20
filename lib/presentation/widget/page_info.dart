import 'package:flutter/material.dart';

import '../../../common/resource/styles.dart';

class PageInfo extends StatelessWidget {
  final Widget image;
  final String header;
  final String description;

  const PageInfo({
    required this.image,
    required this.header,
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: 50.0),
            Text(
              header,
              style: Styles.s18CharcoalW600,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Text(
              description,
              style: Styles.s14CharcoalW500,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
