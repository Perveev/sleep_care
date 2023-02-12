import 'package:sleep_care/data/model/remote/life_style_dto.dart';
import 'package:sleep_care/data/model/remote/sleep_mode_dto.dart';
import 'package:sleep_care/data/source/remote/network_service.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';

class LifeStileApi {
  final NetworkService _networkService;

  LifeStileApi(this._networkService);

  static const _pathLifeStyle = 'api/life_styles/';
  static const _pathSleepMode = 'api/sleeping_modes/';

  Future<List<LifeStyleDto>> getLifeStyles() {
    return _networkService.request(
      _pathLifeStyle,
      HttpMethod.get,
      onParse: (response) {
        final data = response.data as List<dynamic>;
        return LifeStyleDto.fromJsonList(data);
      },
    );
  }

  Future<List<SleepModeDto>> getSleepModes() {
    return _networkService.request(
      _pathSleepMode,
      HttpMethod.get,
      onParse: (response) {
        final data = response.data as List<dynamic>;
        return SleepModeDto.fromJsonList(data);
      },
    );
  }
}
