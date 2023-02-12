import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/life_style.dart';

class ActivitiesController extends BaseController {
  final AdminPanelApi adminPanelApi;
  final AdminPanelRepository _adminPanelRepository;
  List<LifeStyle> activities = [];

  ActivitiesController(this.adminPanelApi, this._adminPanelRepository);

  void loadList() {
    execute<List<LifeStyle>>(_adminPanelRepository.getLifeStyles(),
        onSuccess: (activities) {
      this.activities = activities;
    });
  }

  void addLifeStyle(LifeStyle ageCategory) {
    execute<void>(adminPanelApi.postLifeStyle(ageCategory), onSuccess: (_) {
      loadList();
    });
  }

  void deleteLifeStyle(int index) {
    final category = activities[index];
    execute<void>(adminPanelApi.deleteLifeStyle(category.id ?? -1),
        onSuccess: (_) {
      loadList();
    });
  }

  void refactorLifeStyle(LifeStyle ageCategory, int index) {
    execute<void>(adminPanelApi.changeLifeStyle(ageCategory, index),
        onSuccess: (_) {
      loadList();
    });
  }
}
