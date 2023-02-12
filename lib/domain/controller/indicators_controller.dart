import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/source/remote/api/admin_panel_api.dart';
import 'package:sleep_care/domain/model/indicator.dart';

class IndicatorsController extends BaseController {
  final AdminPanelApi adminPanelApi;
  final AdminPanelRepository _adminPanelRepository;

  List<Indicator> indicators = [];

  IndicatorsController(this.adminPanelApi, this._adminPanelRepository);

  void loadList() {
    execute<List<Indicator>>(_adminPanelRepository.getIndicators(),
        onSuccess: (indicators) {
      this.indicators = indicators;
    });
  }

  void addIndicator(Indicator ageCategory) {
    execute<void>(adminPanelApi.postIndicator(ageCategory), onSuccess: (_) {
      loadList();
    });
  }

  void deleteIndicator(int index) {
    final category = indicators[index];
    execute<void>(adminPanelApi.deleteIndicator(category.id ?? -1),
        onSuccess: (_) {
      loadList();
    });
  }

  void refactorIndicator(Indicator ageCategory, int index) {
    execute<void>(adminPanelApi.changeIndicator(ageCategory, index),
        onSuccess: (_) {
      loadList();
    });
  }
}
