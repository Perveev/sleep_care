import 'package:sleep_care/common/base/base_controller.dart';

class HomeController extends BaseController {
  int currentIndex = 0;
  String locale = 'en';

  set changeLocale(String newLokale) {
    locale = newLokale;
  }

  set changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
