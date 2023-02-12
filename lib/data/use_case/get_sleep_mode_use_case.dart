import 'package:sleep_care/data/repository/life_style_repository.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';

class GetSleepModesUseCase {
  final LifeStyleRepository _lifeStyleRepository;

  GetSleepModesUseCase(this._lifeStyleRepository);

  Future<List<SleepMode>> getSleepModes() =>
      _lifeStyleRepository.getSleepModes();
}
