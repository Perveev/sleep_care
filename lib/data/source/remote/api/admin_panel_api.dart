import 'dart:html';

import 'package:sleep_care/data/model/remote/age_category_dto.dart';
import 'package:sleep_care/data/model/remote/indicators_dto.dart';
import 'package:sleep_care/data/model/remote/life_style_dto.dart';
import 'package:sleep_care/data/model/remote/sleep_mode_dto.dart';
import 'package:sleep_care/data/model/remote/user_dto.dart';
import 'package:sleep_care/data/source/remote/network_service.dart';
import 'package:sleep_care/domain/model/age_category.dart';
import 'package:sleep_care/domain/model/indicator.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/domain/model/user.dart';

class AdminPanelApi {
  final NetworkService _networkService;

  AdminPanelApi(this._networkService);

  static const _pathLifeStyle = 'api/life_styles/';
  static const _pathSleepMode = 'api/sleeping_modes/';
  static const _pathIndicators = 'api/indicators/';
  static const _pathAgeCategory = 'api/age_categories/';
  static const _pathUser = 'api/get_user/';
  static const _pathUserList = 'api/users/';

  static const _access = 'access';
  static const _refresh = 'refresh';
  static const _user = 'user';

  final Storage _localStorage = window.localStorage;

  Future saveAccess(String id) async {
    _localStorage[_access] = id;
  }

  Future saveRefresh(String id) async {
    _localStorage[_refresh] = id;
  }

  Future<String?> getAccess() async => _localStorage[_access];

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

  Future<UserDto> getUser() async {
    return _networkService.request(
      _pathUser,
      HttpMethod.get,
      headers: {
        'Authorization':
        'Bearer ${await getAccess()}',
      },
      onParse: (response) {
        final data = response.data as Map<String, dynamic>;
        print('ok onParse');
        return UserDto.fromJson(data);
      },
    );
  }

  Future<List<UserDto>> getUsers() {
    return _networkService.request(
      _pathUserList,
      HttpMethod.get,
      onParse: (response) {
        final data = response.data as List<dynamic>;
        return UserDto.fromJsonList(data);
      },
    );
  }

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

  Future<List<IndicatorDto>> getIndicators() {
    return _networkService.request(
      _pathIndicators,
      HttpMethod.get,
      onParse: (response) {
        final data = response.data as List<dynamic>;
        return IndicatorDto.fromJsonList(data);
      },
    );
  }

  Future<List<AgeCategoryDto>> getAgeCategory() {
    return _networkService.request(
      _pathAgeCategory,
      HttpMethod.get,
      onParse: (response) {
        final data = response.data as List<dynamic>;
        return AgeCategoryDto.fromJsonList(data);
      },
    );
  }

  Future<void> postAgeCategory(AgeCategory category) {
    return _networkService.request(
      _pathAgeCategory,
      HttpMethod.post,
      data: {"title": category.title, "min": category.min, "max": category.max},
      onParse: (response) {},
    );
  }

  Future<void> postLifeStyle(LifeStyle category) {
    return _networkService.request(
      _pathLifeStyle,
      HttpMethod.post,
      data: {"title": category.title},
      onParse: (response) {},
    );
  }

  Future<void> postIndicator(Indicator category) {
    return _networkService.request(
      _pathIndicators,
      HttpMethod.post,
      data: {
        "title": category.title,
        "unit": category.unit,
        "default_value": category.defaultValue,
      },
      onParse: (response) {},
    );
  }

  Future<void> postSleepMode(SleepMode category) {
    return _networkService.request(
      _pathSleepMode,
      HttpMethod.post,
      data: {"sleep_interval": (category.sleepInterval * 60 * 60.0)},
      onParse: (response) {},
    );
  }

  Future<void> changeAgeCategory(AgeCategory category, index) {
    return _networkService.request(
      _pathAgeCategory + category.id.toString() + '/',
      HttpMethod.put,
      data: {"title": category.title, "min": category.min, "max": category.max},
      onParse: (response) {},
    );
  }

  Future<void> changeLifeStyle(LifeStyle category, index) {
    return _networkService.request(
      _pathLifeStyle + category.id.toString() + '/',
      HttpMethod.put,
      data: {"title": category.title},
      onParse: (response) {},
    );
  }

  Future<void> changeIndicator(Indicator category, index) {
    return _networkService.request(
      _pathIndicators + category.id.toString() + '/',
      HttpMethod.put,
      data: {
        "title": category.title,
        "unit": category.unit,
        "default_value": category.defaultValue,
      },
      onParse: (response) {},
    );
  }

  Future<void> changeSleepsMode(SleepMode category, index) {
    return _networkService.request(
      _pathSleepMode + category.id.toString() + '/',
      HttpMethod.put,
      data: {"sleep_interval": (category.sleepInterval * 60 * 60.0)},
      onParse: (response) {},
    );
  }

  Future<void> deleteAgeCategory(int index) {
    return _networkService.request(
      _pathAgeCategory + index.toString() + '/',
      HttpMethod.delete,
      onParse: (response) {},
    );
  }

  Future<void> deleteLifeStyle(int index) {
    return _networkService.request(
      _pathLifeStyle + index.toString() + '/',
      HttpMethod.delete,
      onParse: (response) {},
    );
  }

  Future<void> deleteIndicator(int index) {
    return _networkService.request(
      _pathIndicators + index.toString() + '/',
      HttpMethod.delete,
      onParse: (response) {},
    );
  }

  Future<void> deleteSleepsMode(int index) {
    return _networkService.request(
      _pathSleepMode + index.toString() + '/',
      HttpMethod.delete,
      onParse: (response) {},
    );
  }
}
