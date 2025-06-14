import 'package:intl/intl.dart';

String numbFormatter(double numb) => NumberFormat('#,##0', 'en_US').format(numb).replaceAll(',', ' ');
