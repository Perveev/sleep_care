import 'package:sleep_care/common/base/base_controller.dart';

class LoginController extends BaseController {
  static const _emailRegex = r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  bool showErrorCheckBox = false;
  bool checkBoxBool = false;

  String? emailError;
  String? passwordError;

  void showEmailError(String errorText) {
    if (emailError == null) {
      emailError = errorText;
      notifyListeners();
    }
  }

  void showPasswordError(String errorText) {
    if (passwordError == null) {
      passwordError = errorText;
      notifyListeners();
    }
  }

  void hideEmailError() {
    if (emailError?.isNotEmpty ?? false) {
      emailError = null;
      notifyListeners();
    }
  }

  void hidePasswordError() {
    if (passwordError?.isNotEmpty ?? false) {
      passwordError = null;
      notifyListeners();
    }
  }

  void changeCheckBox() {
    checkBoxBool = !checkBoxBool;
    notifyListeners();
  }

  bool isAllValid() {
    return emailError == null && checkBoxBool && passwordError == null;
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
    if (password.length < 2) {
      showPasswordError('Введите как минимум 3 симовола');
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
}
