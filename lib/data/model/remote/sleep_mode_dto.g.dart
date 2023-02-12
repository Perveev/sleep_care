// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_mode_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SleepModeDto _$SleepModeDtoFromJson(Map<String, dynamic> json) => SleepModeDto(
      sleepInterval: (json['sleep_interval'] as num?)?.toDouble(),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$SleepModeDtoToJson(SleepModeDto instance) =>
    <String, dynamic>{
      'sleep_interval': instance.sleepInterval,
      'id': instance.id,
    };
