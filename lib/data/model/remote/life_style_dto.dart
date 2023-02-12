import 'package:json_annotation/json_annotation.dart';
import 'package:sleep_care/common/extension/list_extension.dart';

part 'life_style_dto.g.dart';

@JsonSerializable()
class LifeStyleDto{
  final String? title;
  final int? id;

  LifeStyleDto({this.title,this.id});

  factory LifeStyleDto.fromJson(Map<String, dynamic> json) =>
       _$LifeStyleDtoFromJson(json);

  static List<LifeStyleDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.mapToList(
          (dynamic dto) => _$LifeStyleDtoFromJson(dto as Map<String, dynamic>),
    );
  }

   Map<String, dynamic> toJson() => _$LifeStyleDtoToJson(this);
}