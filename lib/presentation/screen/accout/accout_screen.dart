import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/accout_controller.dart';

import 'accout_layout.dart';

class AccountLScreen extends BaseScreen<AccountController, AccountLayout> {
  @override
  AccountController get controller => AccountController(get());

  @override
  AccountLayout get layout => AccountLayout();
}
