import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  // request notification permission
  static Future init() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );
  }

  // get the fcm device token
  static Future getDeviceToken({int maxRetires = 3}) async {
    try {
      String? token;
      // get the device fcm token
      token = await _firebaseMessaging.getToken();
      log("for android device token: $token");
      saveToken(token: token!);
      return token;
    } catch (e) {
      log("failed to get device token");
      if (maxRetires > 0) {
        log("try after 10 sec");
        await Future.delayed(const Duration(seconds: 10));
        return getDeviceToken(maxRetires: maxRetires - 1);
      } else {
        return null;
      }
    }
  }

  static saveToken({required String token}) async {
    // bool isUserLoggedin = await AuthService.isLoggedIn();
    // print("User is logged in $isUserLoggedin");
    // if (isUserLoggedin) {
    //   await CRUDService.saveUserToken(token!);
    //   print("save to firestore");
    // }
    // // also save if token changes
    // _firebaseMessaging.onTokenRefresh.listen((event) async {
    //   if (isUserLoggedin) {
    //     await CRUDService.saveUserToken(token!);
    //     print("save to firestore");
    //   }
    // });
  }
}