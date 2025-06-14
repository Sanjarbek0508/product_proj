import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  String format([String pattern = "dd MMM yyyy"]) => DateFormat(pattern).format(this);

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(Duration(days: 1));
    return day == yesterday.day && month == yesterday.month && year == yesterday.year;
  }
}


// DateTime.now().format() // "21 Apr 2025"
// someDate.isToday // true or false