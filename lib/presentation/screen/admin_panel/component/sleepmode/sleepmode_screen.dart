import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/admin_panel_controller.dart';
import 'package:sleep_care/domain/controller/sleepmode_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/admin_panel_layout.dart';
import 'package:sleep_care/presentation/screen/admin_panel/component/sleepmode/sleepmode_layout.dart';

class SleepModeScreen extends BaseScreen<SleepModeController, SleepModeLayout> {
  @override
  SleepModeController get controller => SleepModeController(get(), get());

  @override
  SleepModeLayout get layout => SleepModeLayout();
}
