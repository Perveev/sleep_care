import 'package:flutter/material.dart';
import 'package:sleep_care/common/base/base_layout.dart';
import 'package:sleep_care/common/resource/drawables.dart';
import 'package:sleep_care/common/resource/strings.dart';
import 'package:sleep_care/common/resource/styles.dart';
import 'package:sleep_care/common/util/url_launcher.dart';
import 'package:sleep_care/domain/controller/about_us_controller.dart';

class AboutUsLayout extends BaseLayout {
  @override
  State<StatefulWidget> createState() => _AboutUsLayoutState();
}

class _AboutUsLayoutState
    extends BaseLayoutState<AboutUsController, AboutUsLayout> with UrlLauncher {
  @override
  Widget buildLayout(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Drawables.getImage(Drawables.logo),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 105.0),
            child: Text(
              Strings.aboutUsDescription,
              style: Styles.s36SapphireW400,
            ),
          ),
          Text(
            Strings.downloadApp,
            style: Styles.s36SapphireW400,
            textAlign: TextAlign.center,
          ),
          GestureDetector(
            onTap: showAppStore,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                Strings.appStoreUrl,
                style: Styles.s36CobaltW400.copyWith(
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showAppStore() {
    tryLaunch(Strings.appStoreUrl);
  }
}
