import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/palette.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/common/util/locale_manager.dart';
import 'package:sleep_care/common/util/url_launcher.dart';
import 'package:sleep_care/domain/controller/admin_panel_controller.dart';
import 'package:sleep_care/presentation/screen/admin_panel/component/users/users_screen.dart';
import 'package:sleep_care/presentation/widget/default_app_bar.dart';

import 'component/activities/activities_screen.dart';
import 'component/age_category/age_category_screen.dart';
import 'component/indicators/indicators_screen.dart';
import 'component/sleepmode/sleepmode_screen.dart';

class AdminPanelLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _AdminPanelLayoutState();
}

class _AdminPanelLayoutState
    extends BaseLayoutState<AdminPanelController, AdminPanelLayout>
    with UrlLauncher {
  @override
  Widget buildLayout(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        backgroundColor: Palette.mayaBlue,
        leading: Row(
          children: [
            InkWell(
              onTap: () => controller.changeIndex = 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  Strings.lifeStyle,
                  overflow: TextOverflow.ellipsis,
                  style: getStyle(controller.currentIndex == 0),
                ),
              ),
            ),
            const VerticalDivider(),
            InkWell(
              onTap: () => controller.changeIndex = 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  Strings.sleepModes,
                  overflow: TextOverflow.ellipsis,
                  style: getStyle(controller.currentIndex == 1),
                ),
              ),
            ),
            const VerticalDivider(),
            InkWell(
              onTap: () => controller.changeIndex = 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  Strings.indicators,
                  overflow: TextOverflow.ellipsis,
                  style: getStyle(controller.currentIndex == 2),
                ),
              ),
            ),
            const VerticalDivider(),
            InkWell(
              onTap: () => controller.changeIndex = 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  Strings.ageCategory,
                  overflow: TextOverflow.ellipsis,
                  style: getStyle(controller.currentIndex == 3),
                ),
              ),
            ),
            const VerticalDivider(),
            InkWell(
              onTap: () => controller.changeIndex = 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0),
                child: Text(
                  'users'.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: getStyle(controller.currentIndex == 4),
                ),
              ),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        index: controller.currentIndex,
        children: [
          ActivitiesScreen(),
          SleepModeScreen(),
          IndicatorsScreen(controller.locale),
          AgeCategoryScreen(),
          UsersScreen(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: Container(
          color: Palette.mayaBlue,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => _changeLanguage(LocaleManager.ukrainianLanguageCode),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Uk',
                    style: getStyle(LocaleManager.ukrainianLanguageCode ==
                        controller.locale),
                  ),
                ),
              ),
              const VerticalDivider(
                padding: 15,
              ),
              InkWell(
                onTap: () {
                  _changeLanguage(LocaleManager.englishLanguageCode);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'En',
                    style: getStyle(
                        LocaleManager.englishLanguageCode == controller.locale),
                  ),
                ),
              ),
              const VerticalDivider(padding: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  Strings.contacts,
                  style: Styles.s32WhiteW500,
                ),
              ),
              GestureDetector(
                child: Drawables.getImage(Drawables.git),
                onTap: () => tryLaunch(Strings.gitUrl),
              ),
              const SizedBox(width: 12.0),
              GestureDetector(
                child: Drawables.getImage(Drawables.telegram),
                onTap: () => tryLaunch(Strings.telegramUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle getStyle(bool isSelected) {
    return isSelected ? Styles.s32SapphireW500 : Styles.s32WhiteW500;
  }

  Future<void> _changeLanguage(String languageCode) async {
    final newLocale = Locale(languageCode);
    await LocaleManager.setLocale(context, newLocale).then(
      (value) => controller.changeLocale = languageCode,
    );
  }
}

class VerticalDivider extends StatelessWidget {
  final double? padding;

  const VerticalDivider({
    Key? key,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 25.0),
      child: Container(
        height: 60,
        width: 1.0,
        color: Palette.white,
      ),
    );
  }
}
