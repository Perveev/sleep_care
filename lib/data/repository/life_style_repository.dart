import 'package:sleep_care/data/mapper/life_style_dto_to_life_style_mapper.dart';
import 'package:sleep_care/data/mapper/sleep_model_dto_to_sleep_model_mapper.dart';
import 'package:sleep_care/data/source/remote/api/life_style_api.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/common/extension/list_extension.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';

class LifeStyleRepository {
  final LifeStileApi _lifeStileApi;
  final LifeStyleDtoToLifeStyleMapper _lifeStyleDtoToLifeStyleMapper;
  final SleepModeDtoToSleepModeMapper _sleepModeDtoToSleepModeMapper;

  LifeStyleRepository(this._lifeStileApi, this._lifeStyleDtoToLifeStyleMapper,
      this._sleepModeDtoToSleepModeMapper);

  Future<List<LifeStyle>> getLifeStyles() async {
    final _lifeStylesDto = await _lifeStileApi.getLifeStyles();
    return _lifeStylesDto.mapToList(_lifeStyleDtoToLifeStyleMapper.map);
  }

  Future<List<SleepMode>> getSleepModes() async {
    final _sleepModesDto = await _lifeStileApi.getSleepModes();
    return _sleepModesDto.mapToList(_sleepModeDtoToSleepModeMapper.map);
  }
}
