import 'dart:developer';
import 'package:intl/intl.dart';

class Constants {
  static const int phoneLength = 10;
  static const int amountLength = 15;
  static const int maxInputLength = 25;
  static const int maxTextLength = 100;
  static const String phoneNum = 'phoneNum';
  static const String email = 'email';
  static const String contactNo= 'contactNo';
  static const String userName = 'userName';
  static const String userId = 'userId';
  static const String token = 'token';
  static const String refreshToken = 'refreshToken';
  static const String uniqueUserId = 'uniqueUserId';
  static const String documentStatus = 'documentStatus';
  static const String isDeposited = 'isDeposited';
  static const String isFirstLaunch = 'isFirstLaunch';
  static const String addressProofFront = 'addressProofFront';
  static const String isOnboarding = 'isOnboarding';
  static const String fcmToken = 'fcmToken';
  static NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
  static NumberFormat numberFormatter = NumberFormat.currency(locale: 'HI', name: '', decimalDigits: 0);
  static const tenMinutes = 600000;

  static String formatTime(DateTime dateTime) {
    return DateFormat.jm().format(dateTime);
  }

  static String formatDateTime(DateTime? dateTime) {
    return dateTime != null ? "${dateTime.day}/${dateTime.month} ${formatTime(dateTime)}":"";
  }

  // String formatDateTime(DateTime? dateTime) {
  //   if (dateTime == null) return '';
  //   return DateFormat.yMMMd().add_jm().format(dateTime);
  // }

  static String getScheduledStatus(DateTime? bidStartTime){
    if (bidStartTime?.day == DateTime.now().day) {
      return "Scheduled for today, ${formatTime(bidStartTime ?? DateTime.now())}";
    } else if (bidStartTime?.day == DateTime.now().day + 1) {
      return "Scheduled for tomorrow, ${DateFormat.jm().format(bidStartTime!)}";
    } else {
      return "Scheduled for, ${formatDateTime(bidStartTime)}";
    }
  }

  static num calculateMinQuote(num amount){
    num tenPercent = amount * 0.10;
    num minQuote = amount - tenPercent;
    log('minQuotePrice=$minQuote');
    return minQuote;
  }
}