import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/about_us_controller.dart';

import 'about_us_layout.dart';

class AboutUsScreen extends BaseScreen<AboutUsController, AboutUsLayout> {
  @override
  AboutUsController get controller => AboutUsController();

  @override
  AboutUsLayout get layout => AboutUsLayout();
}
