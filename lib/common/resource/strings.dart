import 'package:easy_localization/easy_localization.dart';

class Strings {
  Strings._();

  static const String appStoreUrl =
      'https://github.com/Daria-Koshkina?tab=repositories';
  static const String gitUrl =
      'https://github.com/Daria-Koshkina?tab=repositories';
  static const String telegramUrl =
      'https://github.com/Daria-Koshkina?tab=repositories';

  static String get noInternetConnection => 'no_internet_connection'.tr();

  static String get aboutUsDescription => 'about_us_description'.tr();

  static String get downloadApp => 'download_app'.tr();

  static String get about => 'about'.tr();

  static String get indicators => 'indicators'.tr();

  static String get sleepModes => 'sleepModes'.tr();

  static String get lifeStyle => 'lifeStyle'.tr();

  static String get ageCategory => 'ageCategory'.tr();

  static String get save => 'save'.tr();

  static String get rateDescription => 'rate_description'.tr();

  static String get welcomeStatistics => 'welcome_statistics'.tr();

  static String get yourRecommendation => 'your_recommendation'.tr();

  static String get lookStatistick => 'look_statistick'.tr();

  static String get statistikCategory => 'statistik_category'.tr();

  static String get interval => 'interval'.tr();

  static String get date => 'date'.tr();

  static String get score => 'score'.tr();

  static String get weekSleepStatisctik => 'week_sleep_statisctik'.tr();

  static String get age => 'age'.tr();

  static String get pulse => 'pulse'.tr();

  static String get noize => 'noize'.tr();

  static String get addLifeStyle => 'add_life_style'.tr();

  static String get add => 'add'.tr();

  static String get change => 'change'.tr();

  static String get changeLf => 'change_lf'.tr();

  static String get remove => 'remove'.tr();

  static String get sleepInterval => 'sleep_interval'.tr();

  static String get title => 'title'.tr();

  static String get addSm => 'add_sm'.tr();

  static String get changeSm => 'change_sm'.tr();

  static String get illumination => 'illumination'.tr();

  static String get temperature => 'temperature'.tr();

  static String get humidity => 'humidity'.tr();

  static String get statistic => 'statistic'.tr();

  static String get rating => 'rating'.tr();

  static String get account => 'account'.tr();

  static String get contacts => 'contacts'.tr();

  static String get noInternetConnectionDescription =>
      'no_internet_connection_description'.tr();

  static String get somethingWentWrong => 'something_went_wrong'.tr();

  static String resendCodeAfter(int seconds) =>
      'resend_code_after'.tr(namedArgs: {'seconds': '$seconds'});
}
