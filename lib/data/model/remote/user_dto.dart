import 'package:json_annotation/json_annotation.dart';
import 'package:sleep_care/common/extension/list_extension.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  static const _paramSleepMode = 'sleeping_mode';
  static const _paramLifeStyle = 'life_style';

  final String? name;
  final String? surname;
  final String? email;
  final int? age;
  final String? gender;
  @JsonKey(name: _paramLifeStyle)
  final String? life_style;
  @JsonKey(name: _paramSleepMode)
  final double? sleeping_mode;

  UserDto({
    this.name,
    this.surname,
    this.email,
    this.age,
    this.gender,
    this.life_style,
    this.sleeping_mode,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  static List<UserDto> fromJsonList(List<dynamic> jsonList) {
    print('ok fromJsonList');
    return jsonList.mapToList(
      (dynamic dto) => _$UserDtoFromJson(dto as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
