import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleManager {
  LocaleManager._();

  static const translationsPath = 'assets/translations';

  static const englishLanguageCode = 'en';
  static const ukrainianLanguageCode = 'uk';

  // Don't forget to change locale array in ios/Runner/Info.plist
  static const supportedLocales = [
    Locale(englishLanguageCode),
    Locale(ukrainianLanguageCode),
  ];

  static const fallbackLocale = Locale(englishLanguageCode);

  static Future<void> setLocale(BuildContext context, Locale locale) =>
      context.setLocale(locale);
}
