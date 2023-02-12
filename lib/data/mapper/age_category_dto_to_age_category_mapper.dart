import 'package:sleep_care/data/model/remote/age_category_dto.dart';
import 'package:sleep_care/domain/model/age_category.dart';

import 'mapper.dart';

class AgeCategoryDtoToAgeCategoryMapper
    with Mapper<AgeCategoryDto, AgeCategory> {
  @override
  AgeCategory map(AgeCategoryDto model) {
    return AgeCategory(
      title: model.title ?? '',
      min: model.min ?? 0,
      id: model.id ?? 0,
      max: model.max ?? 0,
    );
  }
}
