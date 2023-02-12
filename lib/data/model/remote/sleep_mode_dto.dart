import 'package:json_annotation/json_annotation.dart';
import 'package:sleep_care/common/extension/list_extension.dart';

part 'sleep_mode_dto.g.dart';

@JsonSerializable()
class SleepModeDto{
  static const _paramSleepInterval = 'sleep_interval';

  @JsonKey(name: _paramSleepInterval)
  final double? sleepInterval;
  final int? id;

  SleepModeDto({this.sleepInterval,this.id});

  factory SleepModeDto.fromJson(Map<String, dynamic> json) =>
       _$SleepModeDtoFromJson(json);

  static List<SleepModeDto> fromJsonList(List<dynamic> jsonList) {
    return jsonList.mapToList(
          (dynamic dto) => _$SleepModeDtoFromJson(dto as Map<String, dynamic>),
    );
  }

   Map<String, dynamic> toJson() => _$SleepModeDtoToJson(this);
}