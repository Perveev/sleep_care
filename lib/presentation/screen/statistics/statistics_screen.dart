import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/statistics_controller.dart';
import 'package:sleep_care/presentation/screen/statistics/statistics_layout.dart';

class StatisticsScreen
    extends BaseScreen<StatisticsController, StatisticsLayout> {
  final String locale;

  StatisticsScreen(this.locale);
  @override
  StatisticsController get controller => StatisticsController();

  @override
  StatisticsLayout get layout => StatisticsLayout(locale);
}
