import 'package:sleep_care/data/model/remote/life_style_dto.dart';
import 'package:sleep_care/domain/model/life_style.dart';

import 'mapper.dart';

class LifeStyleDtoToLifeStyleMapper with Mapper<LifeStyleDto, LifeStyle> {
  @override
  LifeStyle map(LifeStyleDto model) {
    return LifeStyle(
      title: model.title ?? '',
      id: model.id ?? 0,
    );
  }
}
