import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart' as http;
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:mera_partners/utils/shared_pref_manager.dart';
import '../firebase_options.dart';
import '../utils/constants.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  Future<void> initialize() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@drawable/mera_cars_notification');

    final DarwinInitializationSettings initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {},
    );

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {});

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_firebaseMessagingForegroundHandler);

    await FirebaseMessaging.instance.subscribeToTopic("all");

    // Create notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await notificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
    NotificationService()._showNotification(message);
  }

  static Future<void> _firebaseMessagingForegroundHandler(RemoteMessage message) async {
    NotificationService()._showNotification(message);
  }

  Future<void> _showNotification(RemoteMessage message) async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      notificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel', // Ensure this matches the channel ID defined in initialize
            'High Importance Notifications',
            channelDescription: 'This channel is used for important notifications.',
            icon: '@drawable/mera_cars_notification',
            sound: RawResourceAndroidNotificationSound('notification'),
            playSound: true
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
            sound: 'notification.mp3'),
        ),
      );
    }
  }

  NotificationDetails _notificationDetails(bool isNegotiation, {Duration? negotiationTimer}) {
    DateTime currentTime = DateTime.now();
    DateTime whenTimer = currentTime.add(negotiationTimer ?? const Duration(seconds: 0));
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'high_importance_channel', // Ensure this matches the channel ID defined in initialize
        'High Importance Notifications',
        icon: '@drawable/mera_cars_notification',
        importance: Importance.max,
        priority: Priority.high,
        indeterminate: true,
        ticker: 'ticker',
        enableVibration: true,
        playSound: true,
        channelShowBadge: true,
        autoCancel: false,
        color: Colors.blue,
        onlyAlertOnce: true,
        sound: const RawResourceAndroidNotificationSound('notification'),
        ongoing: isNegotiation,
        when: isNegotiation ? whenTimer.millisecondsSinceEpoch : null,
        timeoutAfter: isNegotiation ? whenTimer.difference(currentTime).inMilliseconds : null,
        usesChronometer: isNegotiation,
        chronometerCountDown: isNegotiation,
        visibility: NotificationVisibility.public,
        actions: <AndroidNotificationAction>[
          const AndroidNotificationAction(
            'dismiss', // ID of the action
            'Dismiss', // Label of the action
            showsUserInterface: true,
            cancelNotification: true,
            titleColor: MyColors.subTitleColor,
          ),
        ],
      ),
      iOS: const DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
    bool isNegotiation = false,
    Duration? negotiationTimer,
  }) async {
    return notificationsPlugin.show(
      id,
      title,
      body,
      _notificationDetails(isNegotiation, negotiationTimer: negotiationTimer),
      payload: 'item x',
    );
  }

  Future<void> showNegotiationNotification(Duration negotiationTimer) async {
    try {
      await showNotification(
        title: "⏱️ Negotiation ends in 15:20:23",
        body: "You got a final offer for Renault Duster",
        isNegotiation: true,
        negotiationTimer: negotiationTimer,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> showAutoBidNotification() async {
    try {
      await showNotification(
        title: "⏱️ Autobid limit reached",
        body: "Autobid limit reached for the car",
        isNegotiation: false,
      );
    } catch (e) {
      rethrow;
    }
  }

  static Future<String?> getDeviceToken({int maxRetries = 3}) async {
    try {
      String? token = await FirebaseMessaging.instance.getToken();
      log("for android device token: $token");
      if (token != null && token.isNotEmpty) {
        SharedPrefManager.instance.setStringAsync(Constants.fcmToken, token);
        globals.fcmToken = token;
      }
      return token;
    } catch (e) {
      log("failed to get device token");
      if (maxRetries > 0) {
        log("try after 10 sec");
        await Future.delayed(const Duration(seconds: 10));
        return getDeviceToken(maxRetries: maxRetries - 1);
      } else {
        return null;
      }
    }
  }

  static Future<void> saveToken({required dynamic token}) async {
    try {
      var headers = {'Content-Type': 'application/json', 'Authorization': 'Bearer ${globals.token}'};
      var request = http.Request('POST', Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.setFCM + (globals.uniqueUserId ?? '')));
      request.body = jsonEncode({"fcmToken": token, if (Platform.isIOS) "platform": "IOS"});
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
  }

  static Future<void> removeToken(String token) async {
    try {
      var response = await http.post(
        Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.removeFcm + (globals.uniqueUserId ?? '')),
        headers: globals.jsonHeaders,
        body: jsonEncode({"fcmToken": token}),
      );
      log(response.body);
      if (response.statusCode == 200) {
        log("fcm token successfully removed");
      } else {
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> requestPermission() async {
    if (Platform.isIOS) {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true,
      );
    }

    NotificationSettings notificationSettings = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (notificationSettings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User is already granted permissions');
    } else if (notificationSettings.authorizationStatus == AuthorizationStatus.provisional) {
      log('User is already granted provisional permissions');
    } else {
      log('User has denied permission');
    }
  }
}
