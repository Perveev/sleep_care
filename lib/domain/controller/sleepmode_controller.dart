import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';

class SleepModeController extends BaseController {
  final AdminPanelApi adminPanelApi;
  final AdminPanelRepository _adminPanelRepository;
  List<SleepMode> sleepsMode = [];

  SleepModeController(this.adminPanelApi, this._adminPanelRepository);

  void loadList() {
    execute<List<SleepMode>>(_adminPanelRepository.getSleepModes(),
        onSuccess: (sleepsMode) {
      this.sleepsMode = sleepsMode;
    });
  }

  void addActivity(SleepMode ageCategory) {
    execute<void>(adminPanelApi.postSleepMode(ageCategory), onSuccess: (_) {});
    loadList();
  }

  void deleteActivity(int index) {
    final category = sleepsMode[index];
    execute<void>(adminPanelApi.deleteSleepsMode(category.id ?? -1),
        onSuccess: (_) {
      loadList();
    });
  }

  void refactorActivity(SleepMode ageCategory, int index) {
    execute<void>(adminPanelApi.changeSleepsMode(ageCategory, index),
        onSuccess: (_) {
      loadList();
    });
  }
}
