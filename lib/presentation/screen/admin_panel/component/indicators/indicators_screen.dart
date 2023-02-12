import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/domain/controller/indicators_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/component/indicators/indicators_layout.dart';

class IndicatorsScreen
    extends BaseScreen<IndicatorsController, IndicatorsLayout> {
  final String locale;

  IndicatorsScreen(this.locale);

  @override
  IndicatorsController get controller => IndicatorsController(get(), get());

  @override
  IndicatorsLayout get layout => IndicatorsLayout(locale);
}
