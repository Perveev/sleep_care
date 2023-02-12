import 'dart:html' show Storage, window;

import 'package:sleep_care/data/source/remote/network_service.dart';
import 'package:sleep_care/domain/model/user.dart';

class AuthorizationApi {
  final NetworkService _networkService;

  AuthorizationApi(this._networkService);

  static const _pathRegistration = 'auth/register/';
  static const _pathLogin = 'auth/login/';

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

  Future<void> registrationUser(User user) {
    return _networkService.request(
      _pathRegistration,
      HttpMethod.post,
      data: {
        'email': user.email,
        'phone': user.phone,
        'name': user.name,
        'surname': user.surname,
        'password': user.password,
        'gender': user.gender,
        'age': user.age,
        'sleeping_mode': user.sleepingModeId,
        'life_style': user.lifeStyleId,
      },
      onParse: (response) {},
    );
  }

  Future<void> login(String email, String password) {
    return _networkService.request(
      _pathLogin,
      HttpMethod.post,
      data: {
        //ToDO: change
        'email': 'daria.koshkina@nure.ua',
        'password': 'Dasha2002',
      },
      onParse: (response) async {
        saveAccess(response.data[_access]);
        saveRefresh(response.data[_refresh]);
      }
    );
  }
}
