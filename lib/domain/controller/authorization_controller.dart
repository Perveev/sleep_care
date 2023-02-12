import 'package:sleep_care/common/util/phone_formatter.dart';
import 'package:sleep_care/data/use_case/get_life_style_use_case.dart';
import 'package:sleep_care/data/use_case/get_sleep_mode_use_case.dart';
import 'package:sleep_care/data/use_case/registration_user_use_case.dart';
import 'package:sleep_care/domain/model/life_style.dart';
import 'package:sleep_care/domain/model/sleep_mode.dart';
import 'package:sleep_care/domain/model/user.dart';

import '../../common/base/base_controller.dart';

class AuthorizationController extends BaseController {
  static const _emailRegex = r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  final GetLifeStyleUseCase _getLifeStyleUseCase;
  final GetSleepModesUseCase _getSleepModesUseCase;
  final RegistrationUserUseCase _registrationUserUseCase;

  int currentPage = 0;
  int currentActivity = 0;
  int currentSleepMode = 0;

  bool genderIsMale = true;
  bool genderIsFemale = false;
  bool checkBoxBool = false;
  bool showErrorCheckBox = false;

  List<LifeStyle> activities = [];
  List<SleepMode> sleepModes = [];

  String? lastNameError;
  String? firstNameError;
  String? ageError;
  String? emailError;
  String? phoneError;
  String? passwordError;
  String? hourOfSleepError;

  AuthorizationController(
    this._getLifeStyleUseCase,
    this._getSleepModesUseCase,
    this._registrationUserUseCase,
  );

  void loadData() {
    execute<List<LifeStyle>>(
      _getLifeStyleUseCase.getLifeStyles(),
      onSuccess: (lifeStyles) {
        activities = lifeStyles;
        notifyListeners();
      },
    );
    execute<List<SleepMode>>(
      _getSleepModesUseCase.getSleepModes(),
      onSuccess: (sleepModes) {
        this.sleepModes = sleepModes;
        notifyListeners();
      },
    );
  }

  void showLastNameError(String errorText) {
    if (lastNameError == null) {
      lastNameError = errorText;
      notifyListeners();
    }
  }

  void showNameError(String errorText) {
    if (firstNameError == null) {
      firstNameError = errorText;
      notifyListeners();
    }
  }

  void showAgeError(String errorText) {
    if (ageError == null) {
      ageError = errorText;
      notifyListeners();
    }
  }

  void showEmailError(String errorText) {
    if (emailError == null) {
      emailError = errorText;
      notifyListeners();
    }
  }

  void showPhoneError(String errorText) {
    if (phoneError == null) {
      phoneError = errorText;
      notifyListeners();
    }
  }

  void showPasswordError(String errorText) {
    if (passwordError == null) {
      passwordError = errorText;
      notifyListeners();
    }
  }

  void showHoursOfSleepError(String errorText) {
    if (hourOfSleepError == null) {
      hourOfSleepError = errorText;
      notifyListeners();
    }
  }

  void hideLastNameError() {
    if (lastNameError?.isNotEmpty ?? false) {
      lastNameError = null;
      notifyListeners();
    }
  }

  void hideNameError() {
    if (firstNameError?.isNotEmpty ?? false) {
      firstNameError = null;
      notifyListeners();
    }
  }

  void hideHoursOfSleepError() {
    if (hourOfSleepError?.isNotEmpty ?? false) {
      hourOfSleepError = null;
      notifyListeners();
    }
  }

  void hideEmailError() {
    if (emailError?.isNotEmpty ?? false) {
      emailError = null;
      notifyListeners();
    }
  }

  void hidePhoneError() {
    if (phoneError?.isNotEmpty ?? false) {
      phoneError = null;
      notifyListeners();
    }
  }

  void hidePasswordError() {
    if (passwordError?.isNotEmpty ?? false) {
      passwordError = null;
      notifyListeners();
    }
  }

  void hideAgeError() {
    if (ageError?.isNotEmpty ?? false) {
      ageError = null;
      notifyListeners();
    }
  }

  bool isAllValid() {
    return lastNameError == null &&
        firstNameError == null &&
        emailError == null &&
        hourOfSleepError == null &&
        phoneError == null &&
        checkBoxBool &&
        passwordError == null &&
        ageError == null;
  }

  bool _isEmailValid(String email) {
    if (email.isEmpty) {
      showEmailError('Empty Field');
    } else if (!RegExp(_emailRegex).hasMatch(email)) {
      showEmailError('dont correct email');
    }
    if (emailError != null) notifyListeners();
    return emailError == null;
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
    if (age.isNotEmpty) {
      if (8 > (int.tryParse(age) ?? 0)) {
        showAgeError('ВВедите коректный возвраст (от 8 лет)');
      }
    } else {
      showAgeError('ВВедите коректный возвраст (от 8 лет)');
    }
    if (password.length < 8) {
      showPasswordError('Введите как минимум 8 симовол с буквами');
    }
    if (PhoneFormatter.isOperatorValid(phone)) {
      showPhoneError('Такого оператора не существует');
    }
    if (phone.isEmpty) {
      showPhoneError('Введите номер телефона');
    }
    if (firstName.length < 2) {
      showNameError('Введите как минимум 3 симовола');
    }
    if (lastName.length < 2) {
      showLastNameError('Введите как минимум 3 симовола');
    }
    if (!checkBoxBool) {
      showErrorCheckBox = true;
      notifyListeners();
    }

    _isEmailValid(email);

    if (isAllValid()) {
      final user = User(
        name: firstName,
        surname: lastName,
        email: email,
        phone: phone,
        password: password,
        gender: genderIsMale ? 'male' : 'female',
        age: int.tryParse(age) ?? 0,
        sleepingModeId: sleepModes[currentSleepMode].id ?? 0,
        lifeStyleId: activities[currentActivity].id ?? 0,
      );
      execute<void>(_registrationUserUseCase.registrationUser(user),
          onSuccess: (_) {
        onSuccess();
      });
    }
  }

  void increment() {
    currentPage++;
    notifyListeners();
  }

  void changeCheckBox() {
    checkBoxBool = !checkBoxBool;
    notifyListeners();
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
