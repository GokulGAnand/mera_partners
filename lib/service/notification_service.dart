import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mera_partners/utils/colors.dart';

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/mera_cars_notification');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:
              (NotificationResponse notificationResponse) async {});
  }

  notificationDetails(bool isNegotiation, {Duration? negotiationTimer}) {
    DateTime currentTime = DateTime.now();
    DateTime whenTimer = currentTime.add(negotiationTimer ?? Duration(seconds: 0));
    return NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
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
            ongoing: (isNegotiation)?true:false,
            when: (isNegotiation)?whenTimer.millisecondsSinceEpoch:null,
            timeoutAfter: (isNegotiation)?whenTimer.difference(currentTime).inMilliseconds:null,
            usesChronometer: (isNegotiation)?true:false,
            chronometerCountDown: (isNegotiation)?true:false,
            visibility: NotificationVisibility.public,
            // largeIcon: DrawableResourceAndroidBitmap('@drawable/mera_cars_notification'),
            actions: <AndroidNotificationAction>[
              AndroidNotificationAction(
                'dismiss', // ID of the action
                'Dismiss', // Label of the action
                showsUserInterface: true,
                cancelNotification: true,
                titleColor: MyColors.subTitleColor
              ),
            ],
            ),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad, bool isNegotiation = false, Duration? negotiationTimer}) async {
    return notificationsPlugin.show(
        id, title, body, await notificationDetails(isNegotiation, negotiationTimer: negotiationTimer), payload: 'item x');
  }

  Future<void> showNegotiationNotification(Duration negotiationTimer) async {
    try{
      await showNotification(
        title: "⏱️ Negotiation ends in 15:20:23", 
        body: "      You got a final offer for Renault duster", 
        isNegotiation: true,
        negotiationTimer: negotiationTimer,
        );
    } catch(e) {
      throw(e);
    }
  }

  Future<void> showAutoBidNotification() async {
    try{
      await showNotification(
        title: "⏱️ Autobid limit reached", 
        body: "      Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet ", 
        isNegotiation: false);
    } catch(e){
      throw(e);
    }
  }
}