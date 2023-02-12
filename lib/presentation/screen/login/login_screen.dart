import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/login_controller.dart';

import 'login_layout.dart';

class LoginScreen extends BaseScreen<LoginController, LoginLayout> {
  @override
  LoginController get controller => LoginController(get());

  @override
  LoginLayout get layout => LoginLayout();
}
