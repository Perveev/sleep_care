import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/age_category.dart';

class AgeCategoryController extends BaseController {
  final AdminPanelApi adminPanelApi;
  final AdminPanelRepository _adminPanelRepository;
  List<AgeCategory> ageCategories = [];

  AgeCategoryController(this.adminPanelApi, this._adminPanelRepository);

  void loadList() {
    execute<List<AgeCategory>>(_adminPanelRepository.getAgeCategory(),
        onSuccess: (ageCategories) {
      this.ageCategories = ageCategories;
    });
  }

  void addAgeCategory(AgeCategory ageCategory) {
    execute<void>(adminPanelApi.postAgeCategory(ageCategory),
        onSuccess: (_) {});
    loadList();
  }

  void deleteAgeCategory(int index) {
    final category = ageCategories[index];
    execute<void>(adminPanelApi.deleteAgeCategory(category.id ?? -1),
        onSuccess: (_) {
      loadList();
    });
  }

  void refactorAgeCategory(AgeCategory ageCategory, int index) {
    execute<void>(adminPanelApi.changeAgeCategory(ageCategory, index),
        onSuccess: (_) {
      loadList();
    });
  }
}
