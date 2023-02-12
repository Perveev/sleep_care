import 'package:sleep_care/data/model/remote/indicators_dto.dart';
import 'package:sleep_care/domain/model/indicator.dart';

import 'mapper.dart';

class IndicatorDtoToIndicatorMapper with Mapper<IndicatorDto, Indicator> {
  @override
  Indicator map(IndicatorDto model) {
    return Indicator(
      title: model.title ?? '',
      unit: model.unit ?? '',
      defaultValue: model.defaultValue ?? 0,
      id: model.id ?? 0,
    );
  }
}
