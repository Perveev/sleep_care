import 'package:sleep_care/data/model/remote/life_style_dto.dart';
import 'package:sleep_care/data/model/remote/sleep_mode_dto.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';

import 'mapper.dart';

class SleepModeDtoToSleepModeMapper with Mapper<SleepModeDto, SleepMode> {
  @override
  SleepMode map(SleepModeDto model) {
    return SleepMode(
      sleepInterval: (model.sleepInterval ?? 0) / 60 / 60,
      id: (model.id ?? 0),
    );
  }
}
