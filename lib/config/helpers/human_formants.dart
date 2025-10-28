import 'package:intl/intl.dart';
class HumanFormants {
  static String humanReadbleNumber(double number) {
    final formatteNumber = NumberFormat.compact(locale: 'en').format(number);
    return formatteNumber;
  }
}
