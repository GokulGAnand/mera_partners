import 'package:intl/intl.dart';

class Constants {
  static const int phoneLength = 10;
  static const int amountLength = 15;
  static const int maxInputLength = 25;
  static const int maxTextLength = 100;
  static const String phoneNum = 'phoneNum';
  static const String contactNo= 'contactNo';
  static const String userName = 'userName';
  static const String userId = 'userId';
  static const String token = 'token';
  static const String uniqueUserId = 'uniqueUserId';
  static const String documentStatus = 'documentStatus';
  static const String isDeposited = 'isDeposited';
  static const String addressProofFront = 'addressProofFront';
  static NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
}