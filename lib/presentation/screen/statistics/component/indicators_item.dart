import 'package:flutter/material.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/domain/model/indicators.dart';

class IndicatorsItem extends StatelessWidget {
  final IndicatorsValue indicator;
  final TextStyle textStyle;
  final String locale;

  const IndicatorsItem({
    Key? key,
    required this.indicator,
    required this.locale,
    this.textStyle = Styles.s28SapphireW700,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${Strings.humidity} ${indicator.vlaga}%',style: textStyle),
        const SizedBox(height: 2),
        Text('${Strings.temperature} '+ getCurrent(indicator.temperature),style: textStyle),
        const SizedBox(height: 2),
        Text('${Strings.illumination} ${indicator.shine}%',style: textStyle),
        const SizedBox(height: 2),
        Text('${Strings.noize} ${indicator.noize}%',style: textStyle),
      ],
    );
  }
  
  String getCurrent(int unit){
    if(locale == 'en'){
      return '${unit * 2.205} F';
    }
    else {
      return '$unit C';
    }
  }
}
