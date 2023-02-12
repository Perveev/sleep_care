import 'package:sleep_care/common/base/base_controller.dart';
import 'package:sleep_care/data/use_case/login_user_use_case.dart';

class LoginController extends BaseController {
  static const _emailRegex = r'[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';

  final LoginUserUseCase _loginUserUseCase;

  bool showErrorCheckBox = false;
  bool checkBoxBool = false;

  String? emailError;
  String? passwordError;

  LoginController(this._loginUserUseCase);

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

  void tryLogin({
    required String password,
    required String email,
    required void Function() onSuccess,
  }) {
    if (password.length < 2) {
      showPasswordError('Введите как минимум 3 симовола');
    }

    if (!checkBoxBool) {
      showErrorCheckBox = true;
      notifyListeners();
    }

    if (isAllValid()) {
      execute<void>(
        _loginUserUseCase.login(email, password),
        onSuccess: (_) {
          onSuccess();
        },
      );
    }
  }
}
