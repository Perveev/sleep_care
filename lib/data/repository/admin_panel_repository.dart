import 'package:sleep_care/common/extension/list_extension.dart';
import 'package:sleep_care/data/mapper/age_category_dto_to_age_category_mapper.dart';
import 'package:sleep_care/data/mapper/indicators_dto_to_indicators_mapper.dart';
import 'package:sleep_care/data/mapper/life_style_dto_to_life_style_mapper.dart';
import 'package:sleep_care/data/mapper/sleep_model_dto_to_sleep_model_mapper.dart';
import 'package:sleep_care/data/mapper/user_dto_to_user_mapper.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/age_category.dart';
import 'package:sleep_care/domain/model/indicator.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/domain/model/user.dart';

class AdminPanelRepository {
  final AdminPanelApi _adminPanelApi;
  final SleepModeDtoToSleepModeMapper _sleepModeDtoToSleepModeMapper;
  final LifeStyleDtoToLifeStyleMapper _lifeStyleDtoToLifeStyleMapper;
  final IndicatorDtoToIndicatorMapper _indicatorDtoToIndicatorMapper;
  final UserDtoToUserMapper _userDtoToUserMapper;
  final AgeCategoryDtoToAgeCategoryMapper _ageCategoryDtoToAgeCategoryMapper;

  AdminPanelRepository(
    this._adminPanelApi,
    this._sleepModeDtoToSleepModeMapper,
    this._lifeStyleDtoToLifeStyleMapper,
    this._indicatorDtoToIndicatorMapper,
    this._userDtoToUserMapper,
    this._ageCategoryDtoToAgeCategoryMapper,
  );

  Future<List<SleepMode>> getSleepModes() async {
    final _sleepModesDto = await _adminPanelApi.getSleepModes();
    return _sleepModesDto.mapToList(_sleepModeDtoToSleepModeMapper.map);
  }

  Future<User> getUser() async {
    final _userDto = await _adminPanelApi.getUser();
    return _userDtoToUserMapper.map(_userDto);
  }

  Future<List<User>> getUserList() async {
    final _userListDto = await _adminPanelApi.getUsers();
    return _userListDto.mapToList(_userDtoToUserMapper.map);
  }

  Future<List<LifeStyle>> getLifeStyles() async {
    final _sleepModesDto = await _adminPanelApi.getLifeStyles();
    return _sleepModesDto.mapToList(_lifeStyleDtoToLifeStyleMapper.map);
  }

  Future<List<AgeCategory>> getAgeCategory() async {
    final _sleepModesDto = await _adminPanelApi.getAgeCategory();
    return _sleepModesDto.mapToList(_ageCategoryDtoToAgeCategoryMapper.map);
  }

  Future<List<Indicator>> getIndicators() async {
    final _sleepModesDto = await _adminPanelApi.getIndicators();
    return _sleepModesDto.mapToList(_indicatorDtoToIndicatorMapper.map);
  }
}
