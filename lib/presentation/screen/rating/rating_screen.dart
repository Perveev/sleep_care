import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/rating_controller.dart';
import 'package:sleep_care/presentation/screen/rating/rating_layout.dart';

class RatingScreen extends BaseScreen<RatingController, RatingLayout> {
  @override
  RatingController get controller => RatingController();

  @override
  RatingLayout get layout => RatingLayout();
}
