import 'package:easy_localization/easy_localization.dart';

class Strings {
  Strings._();

  static const String appStoreUrl =
      'https://www.youtube.com/watch?v=q92DWs1MwRA';
  static const String gitUrl = 'https://www.youtube.com/watch?v=q92DWs1MwRA';
  static const String telegramUrl =
      'https://www.youtube.com/watch?v=q92DWs1MwRA';

  static String get noInternetConnection => 'no_internet_connection'.tr();

  static String get aboutUsDescription => 'about_us_description'.tr();

  static String get downloadApp => 'download_app'.tr();

  static String get about => 'about'.tr();

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
