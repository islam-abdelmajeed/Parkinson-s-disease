import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

class NotificationService{

  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  static void init(){
    _setUpLocalNotification();
    _requestPermissions();
  }

  static void _requestPermissions() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static void _setUpLocalNotification() async {
    await _configureLocalTimeZone();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('launch_background');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    const DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        // onDidReceiveLocalNotification: (
        //     int id,
        //     String? title,
        //     String? body,
        //     String? payload,
        //     ) async {
        //   showDialog(
        //     context: context,
        //     builder: (context) => AlertDialog(
        //       title: Text(title ?? ''),
        //       content: Text(body ?? ''),
        //     ),
        //   );
        // }
        );

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: (String? payload) async {
      //   if (payload != null) {
      //     debugPrint('notification payload: $payload');
      //   }
      // },
      onDidReceiveNotificationResponse: (details) async {
        if (details.payload != null) {
          debugPrint('notification payload: ${details.payload}');
        }

        log("action id >>>> ${details.actionId}");

        // if (details.actionId == "snooze_action") {
        //   await flutterLocalNotificationsPlugin.cancel(0);
        //   await flutterLocalNotificationsPlugin.zonedSchedule(
        //     0,
        //     'Snooze',
        //     'Snooze for 1 minute',
        //     tz.TZDateTime.now(tz.local).add(const Duration(minutes: 1)),
        //     const NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         'alarm',
        //         'Alarm',
        //         channelDescription: 'Show the alarm',
        //         importance: Importance.max,
        //         priority: Priority.high,
        //         ongoing: true,
        //         autoCancel: false,
        //         actions: [
        //           AndroidNotificationAction(
        //             'snooze_action',
        //             'Snooze',
        //             showsUserInterface: true
        //           ),
        //           AndroidNotificationAction(
        //             'cancel_action',
        //             'Cancel',
        //             showsUserInterface: true
        //           ),
        //         ],
        //       ),
        //     ),
        //     uiLocalNotificationDateInterpretation:
        //         UILocalNotificationDateInterpretation.absoluteTime,
        //     matchDateTimeComponents: DateTimeComponents.time,
        //   );
        // }

        if (details.actionId == "cancel_action") {
          await flutterLocalNotificationsPlugin.cancel(0);
        }
      },
    );
  }

  static Future<void> _configureLocalTimeZone() async {
    if (kIsWeb || Platform.isLinux) {
      return;
    }
    initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    setLocalLocation(
      getLocation(
        timeZoneName,
      ),
    );
  }
}