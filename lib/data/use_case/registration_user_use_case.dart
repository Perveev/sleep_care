import 'package:sleep_care/data/repository/authorization_repository.dart';
import 'package:sleep_care/domain/model/user.dart';

class RegistrationUserUseCase {
  final AuthorizationRepository _authorizationRepository;

  RegistrationUserUseCase(this._authorizationRepository);

  Future<void> registrationUser(User user) =>
      _authorizationRepository.registrationUser(user);
}
