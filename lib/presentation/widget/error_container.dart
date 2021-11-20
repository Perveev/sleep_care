import 'package:flutter/material.dart';

import '../../common/resource/palette.dart';
import '../../common/resource/styles.dart';

class ErrorContainer extends StatelessWidget {
  final List<String> errors;

  const ErrorContainer(this.errors);

  @override
  Widget build(BuildContext context) {
    return errors.isNotEmpty
        ? Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8.0),
              ),
              color: Palette.coralCandy,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                errors.length,
                (index) {
                  return Padding(
                    padding: EdgeInsets.only(top: index == 0 ? 0 : 6.0),
                    child: Text(
                      '●  ${errors[index]}',
                      textAlign: TextAlign.left,
                      style: Styles.s14VenetianRedW600,
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
