import 'package:sleep_care/common/base/base_controller.dart';

class AdminPanelController extends BaseController {
  int currentIndex = 0;
  String locale = 'en';

  set changeLocale(String newLocale) {
    locale = newLocale;
  }

  set changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
