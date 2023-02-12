import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/domain/model/sleep_score.dart';

class StatisticsController extends BaseController {
  final List<SleepScore> sleepScores = [
    SleepScore(10, '10.05.2022', 9),
    SleepScore(5, '09.05.2022', 6),
    SleepScore(3, '08.05.2022', 6),
    SleepScore(9, '07.05.2022', 8),
    SleepScore(6, '06.05.2022', 7),
  ];
}
