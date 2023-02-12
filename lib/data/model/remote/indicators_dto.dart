import 'package:json_annotation/json_annotation.dart';
import 'package:sleep_care/common/extension/list_extension.dart';

part 'indicators_dto.g.dart';

@JsonSerializable()
class IndicatorDto {
  static const _paramDefaultValue = 'default_value';

  final String? title;
  final String? unit;
  @JsonKey(name: _paramDefaultValue)
  final double? defaultValue;
  final int? id;

  IndicatorDto({this.title, this.unit, this.defaultValue,this.id});

  factory IndicatorDto.fromJson(Map<String, dynamic> json) =>
      _$IndicatorDtoFromJson(json);

  static List<IndicatorDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.mapToList(
      (dynamic dto) => _$IndicatorDtoFromJson(dto as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$IndicatorDtoToJson(this);
}
