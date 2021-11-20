import 'package:sleep_care/common/util/phone_formatter.dart';

import '../../common/base/base_controller.dart';

class AuthorizationController extends BaseController {
  static const _emailRegex = r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  int currentPage = 0;
  int currentActivity = 0;
  int timeOfSleep = 0;
  bool genderIsMale = true;
  bool genderIsFemale = false;
  bool checkBoxBool = false;
  bool showErrorCheckBox = false;
  final List<String> activities = [
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
    'text',
  ];

  String? lastNameError;
  String? firstNameError;
  String? ageError;
  String? emailError;
  String? phoneError;
  String? passwordError;
  String? hourOfSleepError;

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
    required void Function() onUpdated,
  }) {
    if (age.isNotEmpty) {
      if (8 > (int.tryParse(age) ?? 0)) {
        showAgeError('ВВедите коректный возвраст (от 8 лет)');
      }
    } else {
      showAgeError('ВВедите коректный возвраст (от 8 лет)');
    }
    if (password.length < 2) {
      showPasswordError('Введите как минимум 3 симовола');
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
    if (timeOfSleep < 4) {
      showHoursOfSleepError('Введенно не коректное число');
    }
    if (!checkBoxBool) {
      showErrorCheckBox = true;
      notifyListeners();
    }

    _isEmailValid(email);

    if (isAllValid()) {
      onUpdated();
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
}
