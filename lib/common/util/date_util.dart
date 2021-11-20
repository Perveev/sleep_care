import 'package:easy_localization/easy_localization.dart';

class DateUtil {
  static const monthDayPattern = 'MMMMd';
  static const dayShortMonthYearPattern = 'd MMM yyyy';
  static const dayShortMonthPattern = 'MMMd';
  static const dayMonthYearDotSeparatedPattern = 'dd.MM.yyyy';

  DateUtil._();

  static String format({
    DateTime? date,
    String pattern = dayShortMonthYearPattern,
  }) {
    var formattedDate = '';
    if (date != null) {
      formattedDate = DateFormat(pattern, Intl.systemLocale).format(date);
    }
    return formattedDate;
  }

  static DateTime parse(String date) => DateTime.parse(date);

  static String toServerFormat(DateTime date) => date.toIso8601String();

  static int daysInCurrentMonth() {
    final now = DateTime.now();
    final firstDayThisMonth = DateTime(
      now.year,
      now.month,
      now.day,
    );
    final firstDayNextMonth = DateTime(
      firstDayThisMonth.year,
      firstDayThisMonth.month + 1,
      firstDayThisMonth.day,
    );
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}
