import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import '../utils/constants.dart';
import '../utils/shared_pref_manager.dart';
import 'dart:io' show Platform;

class PushNotifications {
  static final _firebaseMessaging = FirebaseMessaging.instance;

  // request notification permission
  static Future init() async {
    if (Platform.isIOS) {
      await _firebaseMessaging.requestPermission(
          alert: true,
          announcement: true,
          badge: true,
          carPlay: true,
          criticalAlert: true,
          provisional: true,
          sound: true);
    }

    NotificationSettings notificationSettings =
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      AppleNotification? apple = message.notification?.apple;

      if (notification != null && (android != null || apple != null)) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              '@mipmap/ic_launcher', // Replace with your app icon
              'channel name',
              importance: Importance.max,
              priority: Priority.high,
              showWhen: false,
              sound: RawResourceAndroidNotificationSound('notification')
            ),
            iOS: DarwinNotificationDetails(sound: 'notification.mp3'),
          ),
        );
      }
    });

    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      log('user is already granted permissions');
    } else if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('user is already granted provisional permissions');
    } else {
      log('User has denied permission');
    }
  }

  // get the fcm device token
  static Future getDeviceToken({int maxRetires = 3}) async {
    try {
      String? token;
      // get the device fcm token
      token = await _firebaseMessaging.getToken();
      log("for android device token: $token");
      if (token != null && token.isNotEmpty) {
        SharedPrefManager.instance.setStringAsync(Constants.fcmToken, token);
        globals.fcmToken = token;
      }
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

  static saveToken({required dynamic token}) async {
    try {
      var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer ${globals.token}'};
      var request = http.Request('POST', Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.setFCM + (globals.uniqueUserId ?? '')));
      request.body = jsonEncode({"fcmToken": token,if(Platform.isIOS)"platform": "IOS"});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        log("fcm token successfully saved");
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
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

  static removeToken(String token) async {
    try {
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.setFCM + (globals.uniqueUserId ?? '')), headers: globals.jsonHeaders, body: jsonEncode({"fcmToken": token}));
      log(response.body);
      if(response.statusCode == 200){
        log("fcm token successfully removed");
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}