import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/sleepmode_controller.dart';
import 'package:sleep_care/domain/controller/users_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/component/users/users_layout.dart';

class UsersScreen extends BaseScreen<UsersController,UsersLayout> {
  @override
  UsersController get controller => UsersController(get());

  @override
  UsersLayout get layout =>UsersLayout();
}
