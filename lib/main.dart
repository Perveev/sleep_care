import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sleep_care/presentation/screen/authorization/authorization_screen.dart';

import 'common/resource/theme.dart';
import 'common/util/locale_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
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
      // initialRoute: Routes.home,
      // onGenerateRoute: generateRoute,
    );
  }

// String _initialRoute() {
//   var initialRoute = Routes.intro;
//   if (registrationStatus.isRegistrationCompleted) {
//     initialRoute = Routes.home;
//   } else if (registrationStatus.isInfoFilled) {
//     initialRoute = Routes.meeting;
//   } else if (registrationStatus.isAuthorized) {
//     initialRoute = Routes.personInfo;
//   } else if (registrationStatus.isTutorialViewed) {
//     initialRoute = Routes.phoneInput;
//   }
//   return initialRoute;
// }
}
