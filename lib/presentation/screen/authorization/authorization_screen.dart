import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/authorization_controller.dart';

import '../../../../../../../common/base/base_screen.dart';
import 'authorization_layout.dart';

class AuthorizationScreen
    extends BaseScreen<AuthorizationController, AuthorizationLayout> {
  @override
  AuthorizationController get controller => AuthorizationController(get(),get(),get());

  @override
  AuthorizationLayout get layout => AuthorizationLayout();
}
