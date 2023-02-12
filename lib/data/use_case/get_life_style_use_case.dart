import 'package:sleep_care/data/repository/life_style_repository.dart';
import 'package:sleep_care/domain/model/life_style.dart';

class GetLifeStyleUseCase {
  final LifeStyleRepository _lifeStyleRepository;

  GetLifeStyleUseCase(this._lifeStyleRepository);

  Future<List<LifeStyle>> getLifeStyles() => _lifeStyleRepository.getLifeStyles();
}
