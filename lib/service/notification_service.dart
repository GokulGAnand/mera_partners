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

  notificationDetails() {
    DateTime currentTime = DateTime.now();
            DateTime whenTimer = currentTime.add(Duration(minutes: 5));
    return NotificationDetails(
        android: AndroidNotificationDetails('channelId', 'channelName',
        icon: '@drawable/mera_cars_notification',
            importance: Importance.max,
            priority: Priority.high,
            indeterminate: true,
            ticker: 'ticker',
            enableVibration: true,
            playSound: true,
            ongoing: true,
            channelShowBadge: true,
            autoCancel: false,
            color: Colors.blue,
             onlyAlertOnce: true,
            when: whenTimer.millisecondsSinceEpoch,
            timeoutAfter: whenTimer.difference(currentTime).inMilliseconds,
            usesChronometer: true,
            chronometerCountDown: true,
            visibility: NotificationVisibility.public,
            // largeIcon: DrawableResourceAndroidBitmap('@drawable/mera_cars_notification'),
            actions: <AndroidNotificationAction>[
              AndroidNotificationAction(
                'dismiss', // ID of the action
                'Dismiss', // Label of the action
                showsUserInterface: false,
                cancelNotification: true,
                titleColor: MyColors.subTitleColor
                
              ),
              // AndroidNotificationAction(
              //   'no_action', // ID of the action
              //   'No',  // Label of the action
              //   showsUserInterface: true,
              // ),
            ],
            ),
        iOS: DarwinNotificationDetails());
  }

  Future showNotification(
      {int id = 0, String? title, String? body, String? payLoad}) async {
        print("show");
    return notificationsPlugin.show(
        id, title, body, await notificationDetails(), payload: 'item x');
  }
}