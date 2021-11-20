import 'package:sleep_care/domain/controller/authorization_controller.dart';

import '../../../../../../../common/base/base_screen.dart';
import 'authorization_layout.dart';

class AuthorizationScreen
    extends BaseScreen<AuthorizationController, AuthorizationLayout> {
  @override
  AuthorizationController get controller => AuthorizationController();

  @override
  AuthorizationLayout get layout => AuthorizationLayout();
}
