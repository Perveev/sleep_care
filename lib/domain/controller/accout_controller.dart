import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/repository/admin_panel_repository.dart';
import 'package:sleep_care/data/use_case/get_life_style_use_case.dart';
import 'package:sleep_care/data/use_case/get_sleep_mode_use_case.dart';
import 'package:sleep_care/data/use_case/registration_user_use_case.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/domain/model/user.dart';

class AccountController extends BaseController {
  static const _emailRegex = r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  final AdminPanelRepository _adminPanelRepository;

  int currentPage = 0;
  int currentActivity = 0;
  int currentSleepMode = 0;

  bool genderIsMale = true;
  bool genderIsFemale = false;
  bool checkBoxBool = false;
  bool showErrorCheckBox = false;

  List<LifeStyle> activities = [];
  List<SleepMode> sleepModes = [];
  User? user;

  String? lastNameError;
  String? firstNameError;
  String? ageError;
  String? emailError;
  String? phoneError;
  String? passwordError;
  String? hourOfSleepError;

  AccountController(
    this._adminPanelRepository,
  );

  void loadData() {
    execute<User>(
      _adminPanelRepository.getUser(),
      onSuccess: (user) {
        print('ok loadData');
        this.user = user;
        notifyListeners();
      },
    );
  }

  void tryRegistration({
    required String lastName,
    required String firstName,
    required String age,
    required String password,
    required String phone,
    required String email,
    required void Function() onSuccess,
  }) {
    if (!checkBoxBool) {
      showErrorCheckBox = true;
      notifyListeners();
    }

    final user = User(
      name: firstName,
      surname: lastName,
      email: email,
      phone: phone,
      password: password,
      gender: genderIsMale ? 'male' : 'female',
      age: int.tryParse(age) ?? 0,
      sleepingModeId: currentSleepMode + 1,
      lifeStyleId: currentActivity + 1,
    );
  }

  void changeGender() {
    genderIsMale = !genderIsMale;
    genderIsFemale = !genderIsFemale;
    notifyListeners();
  }

  void changeCurrentActivity(int newActivity) {
    currentActivity = newActivity;
    notifyListeners();
  }

  void changeSleepMode(int sleepMode) {
    currentSleepMode = sleepMode;
    notifyListeners();
  }
}
