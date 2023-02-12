import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sleep_care/core/di/dependency_provider.dart';
import 'package:sleep_care/presentation/screen/admin_panel/admin_panel_screen.dart';
import 'package:sleep_care/presentation/screen/authorization/authorization_screen.dart';
import 'package:sleep_care/presentation/screen/home/home_screen.dart';
import 'package:sleep_care/presentation/screen/rating/rating_screen.dart';
import 'package:sleep_care/presentation/screen/statistics/statistics_screen.dart';

import 'common/resource/theme.dart';
import 'common/util/locale_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupDI(isDebug: kDebugMode);
  runApp(
    EasyLocalization(
      path: LocaleManager.translationsPath,
      fallbackLocale: LocaleManager.fallbackLocale,
      supportedLocales: LocaleManager.supportedLocales,
      child: Application(),
    ),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sleep Care',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localeResolutionCallback: (_, __) {
        Intl.systemLocale = context.locale.languageCode;
        return context.locale;
      },
      theme: buildTheme(),
      home: AuthorizationScreen(),
    );
  }
}
