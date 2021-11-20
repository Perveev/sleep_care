import 'package:flutter/material.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/presentation/screen/authorization/authorization_layout.dart';

class ActiveGender extends StatelessWidget {
  final Gender gender;
  final bool isActive;

  const ActiveGender({Key? key, required this.gender, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        color: isActive ? Palette.cobalt : Palette.transparent,
      ),
      child: Center(
        child: Text(
          gender == Gender.male ? 'Male' : 'Female',
          style: Styles.s17WhiteW700,
        ),
      ),
    );
  }
}
