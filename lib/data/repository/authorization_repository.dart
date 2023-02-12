import 'package:sleep_care/domain/model/user.dart';

import '../source/local/database.dart';
import '../source/remote/api/authorization_api.dart';

class AuthorizationRepository {
  final AuthorizationApi _authorizationApi;

  AuthorizationRepository(this._authorizationApi);

  Future<void> registrationUser(User user) async =>
      await _authorizationApi.registrationUser(user);

  Future<void> login(String email, String password) async =>
      await _authorizationApi.login(email,password);

}
