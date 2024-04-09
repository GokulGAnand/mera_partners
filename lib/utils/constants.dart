import 'package:intl/intl.dart';

class Constants {
  static const int phoneLength = 10;
  static const int amountLength = 15;
  static const int maxInputLength = 25;
  static const int maxTextLength = 100;
  static const String phoneNum = 'phoneNum';
  static NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
}