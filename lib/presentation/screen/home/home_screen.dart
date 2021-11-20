import 'package:sleep_care/common/base/base_screen.dart';
import 'package:sleep_care/domain/controller/home_controller.dart';
import 'package:sleep_care/presentation/screen/home/home_layout.dart';

class HomeScreen extends BaseScreen<HomeController, HomeLayout> {
  @override
  HomeController get controller => HomeController();

  @override
  HomeLayout get layout => HomeLayout();
}
