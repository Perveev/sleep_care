import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/common/util/input_formatter_factory.dart';
import 'package:sleep_care/domain/controller/login_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/admin_panel_screen.dart';
import 'package:sleep_care/presentation/screen/home/home_screen.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class LoginLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _LoginLayoutState();
}

class _LoginLayoutState extends BaseLayoutState<LoginController, LoginLayout> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ColoredBox(
            color: Palette.mayaBlue,
            child: Center(child: Drawables.getImage(Drawables.logo)),
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: Column(
              children: [
                const Text(
                  'WELCOME BACK',
                  style: Styles.s64SapphireW700,
                ),
                const SizedBox(height: 60.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 300.0, vertical: 16.0),
                  child: TextField(
                    controller: emailController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'E-mail',
                      errorText: controller.emailError,
                    ),
                    inputFormatters: InputFormatterFactory.email(),
                    onChanged: (text) {
                      controller.hideEmailError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 300.0,
                    vertical: 16.0,
                  ),
                  child: TextField(
                    controller: passwordController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'Password',
                      errorText: controller.passwordError,
                    ),
                    obscureText: true,
                    onChanged: (text) {
                      controller.hidePasswordError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 300.0, vertical: 16.0),
                  child: Row(
                    children: [
                      Checkbox(
                        value: controller.checkBoxBool,
                        onChanged: (_) {
                          controller.changeCheckBox();
                          controller.showErrorCheckBox = false;
                        },
                      ),
                      const SizedBox(width: 21.0),
                      const Expanded(
                        child: Text(
                          'Ставя галочку вы разрешаете использовать\nи обрабатывать ваши данные',
                          style: Styles.s24CharcoalW500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 21.0),
                if (controller.showErrorCheckBox)
                  const Text(
                    'Для продолжения разрешите использовать данные',
                    style: Styles.s12VenetianRedW400,
                  ),
                const SizedBox(width: 32.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 295.0, vertical: 16.0),
                  child: RoundedButton(
                    text: 'Sign Up',
                    color: Palette.sapphire,
                    onTap: () {
                      controller.tryLogin(
                        password: passwordController.text,
                        email: emailController.text,
                        onSuccess: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  emailController.text == 'admin'
                                      ? AdminPanelScreen()
                                      : HomeScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
