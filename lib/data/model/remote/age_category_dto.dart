import 'package:json_annotation/json_annotation.dart';
import 'package:sleep_care/common/extension/list_extension.dart';

part 'age_category_dto.g.dart';

@JsonSerializable()
class AgeCategoryDto {
  final String? title;
  final int? min;
  final int? id;
  final int? max;

  AgeCategoryDto({this.title, this.min, this.max,this.id});

  factory AgeCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$AgeCategoryDtoFromJson(json);

  static List<AgeCategoryDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.mapToList(
      (dynamic dto) => _$AgeCategoryDtoFromJson(dto as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$AgeCategoryDtoToJson(this);
}
