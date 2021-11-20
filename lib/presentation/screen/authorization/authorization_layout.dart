import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/common/util/input_formatter_factory.dart';
import 'package:sleep_care/common/util/mask_input_formatter.dart';
import 'package:sleep_care/presentation/screen/home/home_screen.dart';
import 'package:sleep_care/presentation/widget/border_action_button.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

import '../../../../../../../common/base/base_layout.dart';
import '../../../domain/controller/authorization_controller.dart';
import 'component/active_gender.dart';
import 'component/life_style_item.dart';

class AuthorizationLayout extends BaseLayout {
  @override
  _AuthorizationLayoutState createState() => _AuthorizationLayoutState();
}

class _AuthorizationLayoutState
    extends BaseLayoutState<AuthorizationController, AuthorizationLayout> {
  final lastnameController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final timeSleepController = TextEditingController();

  late Gender? selectedGender;

  final phoneInputFormatter = MaskInputFormatter(
    mask: InputFormatterFactory.phoneMask,
  );
  static const _phoneInputHint = '+38 (_ _ _)  _ _ _  _ _  _ _';

  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoginTile(),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 56.0),
                const Text(
                  'Create Account',
                  style: Styles.s64SapphireW700,
                ),
                const SizedBox(height: 110.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 140.0, vertical: 16.0),
                  child: TextField(
                    controller: nameController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'Name',
                      errorText: controller.firstNameError,
                    ),
                    inputFormatters: InputFormatterFactory.name(),
                    onChanged: (text) {
                      controller.hideNameError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 140.0, vertical: 16.0),
                  child: TextField(
                    controller: lastnameController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'Surname',
                      errorText: controller.lastNameError,
                    ),
                    inputFormatters: InputFormatterFactory.name(),
                    onChanged: (text) {
                      controller.hideLastNameError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 140.0, vertical: 16.0),
                  child: TextField(
                    controller: ageController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'Age',
                      errorText: controller.ageError,
                    ),
                    inputFormatters: InputFormatterFactory.twoDigits(),
                    onChanged: (text) {
                      controller.hideAgeError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 140.0, vertical: 16.0),
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
                    horizontal: 140.0,
                    vertical: 16.0,
                  ),
                  child: TextField(
                    controller: phoneController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      prefixStyle: Styles.s14CharcoalW500,
                      hintText: _phoneInputHint,
                      errorText: controller.phoneError,
                    ),
                    inputFormatters: [phoneInputFormatter],
                    onChanged: (text) {
                      controller.hidePhoneError();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140.0,
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
                    horizontal: 140.0,
                    vertical: 16.0,
                  ),
                  child: TextField(
                    onTap: _pickDates,
                    readOnly: true,
                    keyboardType: TextInputType.none,
                    controller: timeSleepController,
                    style: Styles.s14CharcoalW500,
                    decoration: Styles.roundInputBoxDecoration.copyWith(
                      hintText: 'Hours of sleep',
                      errorText: controller.hourOfSleepError,
                    ),
                    onChanged: (text) => controller.hideHoursOfSleepError(),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 220.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      color: Palette.mayaBlue,
                    ),
                    height: 61.0,
                    child: GestureDetector(
                      onTap: controller.changeGender,
                      child: Row(
                        children: [
                          Expanded(
                              child: ActiveGender(
                            gender: Gender.male,
                            isActive: controller.genderIsMale,
                          )),
                          Expanded(
                              child: ActiveGender(
                            gender: Gender.female,
                            isActive: controller.genderIsFemale,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 72),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 140.0,
                    vertical: 16.0,
                  ),
                  child: SizedBox(
                    height: 43.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.activities.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () => controller.changeCurrentActivity(index),
                          child: LifeStyleItem(
                            text: controller.activities[index],
                            isActive: controller.currentActivity == index,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 140.0, vertical: 16.0),
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
                          'Ставя галочку вы разрешаете использовать и обрабатывать ваши данные',
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
                const SizedBox(width: 90.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 320.0,
                    vertical: 16.0,
                  ),
                  child: RoundedButton(
                    text: 'Sign Up',
                    color: Palette.sapphire,
                    onTap: () {
                      controller.tryRegistration(
                        lastName: lastnameController.text,
                        firstName: nameController.text,
                        age: ageController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                        email: emailController.text,
                        onUpdated: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _pickDates() async {
    FocusScope.of(context).unfocus();
    final newTime = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
    );
    if (newTime != null) {
      // controller
      controller.hideHoursOfSleepError();
      controller.timeOfSleep = newTime.hour;
      timeSleepController.text =
          "${newTime.hour} hours ${newTime.minute} minutes";
    }
  }
}

class LoginTile extends StatelessWidget {
  const LoginTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(32.0),
        color: Palette.mayaBlue,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Drawables.getImage(Drawables.logo),
            const SizedBox(height: 48.0),
            const FittedBox(
              fit: BoxFit.fill,
              child: Text(
                'WELCOME',
                style: Styles.s64WhiteW700,
              ),
            ),
            const SizedBox(height: 120.0),
            const Text(
              'If you already have account please sign in',
              textAlign: TextAlign.center,
              style: Styles.s24WhiteW400,
            ),
            const SizedBox(height: 150.0),
            BorderActionButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              text: 'Sign in',
              color: Palette.mayaBlue,
              borderColor: Palette.white,
              style: Styles.s24WhiteW400,
            ),
            const SizedBox(height: 650.0),
          ],
        ),
      ),
    );
  }
}

enum Gender {
  male,
  female,
}
