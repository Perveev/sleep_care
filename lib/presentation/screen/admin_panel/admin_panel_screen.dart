import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/admin_panel_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/admin_panel_layout.dart';

class AdminPanelScreen
    extends BaseScreen<AdminPanelController, AdminPanelLayout> {
  @override
  AdminPanelController get controller => AdminPanelController();

  @override
  AdminPanelLayout get layout => AdminPanelLayout();
}
