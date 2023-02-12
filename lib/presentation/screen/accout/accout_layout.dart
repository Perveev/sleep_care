import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/common/util/input_formatter_factory.dart';
import 'package:sleep_care/common/util/mask_input_formatter.dart';
import 'package:sleep_care/domain/controller/accout_controller.dart';
import 'package:sleep_care/presentation/screen/authorization/authorization_layout.dart';
import 'package:sleep_care/presentation/screen/authorization/component/active_gender.dart';
import 'package:sleep_care/presentation/screen/authorization/component/life_style_item.dart';
import 'package:sleep_care/presentation/widget/rounded_button.dart';

class AccountLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _AccountLayoutState();
}

class _AccountLayoutState
    extends BaseLayoutState<AccountController, AccountLayout> {
  late Gender? selectedGender;

  final phoneInputFormatter = MaskInputFormatter(
    mask: InputFormatterFactory.phoneMask,
  );
  static const _phoneInputHint = '+38 (_ _ _)  _ _ _  _ _  _ _';

  final lastNameController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final timeSleepController = TextEditingController();

  @override
  void onInit() => controller.loadData();

  @override
  Widget buildLayout(BuildContext context) {
    nameController.text = controller.user?.name ?? '';
    lastNameController.text = controller.user?.surname ?? '';
    ageController.text = controller.user?.age.toString() ?? '';
    emailController.text = controller.user?.email ?? '';
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 56.0),
          const Text(
            'Your Account',
            style: Styles.s64SapphireW700,
          ),
          const SizedBox(height: 110.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 140.0, vertical: 16.0),
            child: TextField(
              controller: nameController,
              style: Styles.s14CharcoalW500,
              decoration: Styles.roundInputBoxDecoration.copyWith(
                hintText: 'Name',
              ),
              inputFormatters: InputFormatterFactory.name(),
              onChanged: (text) {},
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 140.0, vertical: 16.0),
            child: TextField(
              controller: lastNameController,
              style: Styles.s14CharcoalW500,
              decoration: Styles.roundInputBoxDecoration.copyWith(
                hintText: 'Surname',
              ),
              inputFormatters: InputFormatterFactory.name(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 140.0,
              vertical: 16.0,
            ),
            child: TextField(
              controller: ageController,
              style: Styles.s14CharcoalW500,
              decoration: Styles.roundInputBoxDecoration.copyWith(
                hintText: 'Age',
              ),
              inputFormatters: InputFormatterFactory.twoDigits(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 140.0,
              vertical: 16.0,
            ),
            child: TextField(
              controller: emailController,
              style: Styles.s14CharcoalW500,
              decoration: Styles.roundInputBoxDecoration.copyWith(
                hintText: 'E-mail',
              ),
              inputFormatters: InputFormatterFactory.email(),
            ),
          ),
        ],
      ),
    );
  }
}
