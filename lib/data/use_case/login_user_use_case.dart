import 'package:sleep_care/data/repository/authorization_repository.dart';

class LoginUserUseCase {
  final AuthorizationRepository _authorizationRepository;

  LoginUserUseCase(this._authorizationRepository);

  Future<void> login(String email, String password) =>
      _authorizationRepository.login(email, password);
}
