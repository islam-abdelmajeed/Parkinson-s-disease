import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart';

import '../../Models/alarm/alarm_hive_storage.dart';
import '../../Models/alarm/alarm_params.dart';
import '../../helpers/clock_helper.dart';

class AlarmModel extends ChangeNotifier {
  final AlarmsHiveLocalStorage _storage;

  AlarmState? state;
  List<AlarmDataModel>? alarms;
  bool loading = true;

  AlarmModel(AlarmsHiveLocalStorage storage) : _storage = storage {
    _storage.init().then((_) => loadAlarms());
  }

  @override
  void dispose() {
    _storage.dispose();
    super.dispose();
  }

  void loadAlarms() async {
    // state = AlarmLoading();
    // notifyListeners();
    this.alarms = [];
    final alarms = await _storage.loadAlarms();

    log("data loaded successfully");

    this.alarms = List.from(alarms);
    // this.alarms?.add(
    //   AlarmDataModel(time: DateTime.now(), day: 1, title: "test")
    // );
    state = AlarmLoaded(alarms);
    loading = false;
    notifyListeners();
  }

  Future<void> addAlarm(AlarmDataModel alarm) async {
    loading = true;
    notifyListeners();

    final newAlarm = await _storage.addAlarm(alarm);
    alarms!.add(newAlarm);
    alarms!.sort(alarmSort);

    alarms = List.from(alarms!);

    loading = false;
    state = AlarmCreated(
      alarm,
      alarms!.indexOf(newAlarm),
    );
    notifyListeners();

    await _scheduleAlarm(alarm);
  }

  Future<void> updateAlarm(AlarmDataModel alarm, int index) async {
    loading = true;
    notifyListeners();

    final newAlarm = await _storage.updateAlarm(alarm);

    alarms![index] = newAlarm;
    alarms!.sort(alarmSort);
    alarms = List.from(alarms!);

    loading = false;
    state = AlarmUpdated(
      newAlarm,
      alarm,
      index,
      alarms!.indexOf(newAlarm),
    );
    notifyListeners();

    await _removeScheduledAlarm(alarm);
    await _scheduleAlarm(newAlarm);
  }

  Future<void> deleteAlarm(AlarmDataModel alarm, int index) async {
    loading = true;
    notifyListeners();

    await _storage.removeAlarm(alarm);

    alarms!.removeAt(index);

    loading = false;
    state = AlarmDeleted(
      alarm,
      index,
    );
    notifyListeners();

    await _removeScheduledAlarm(alarm);
  }

  int alarmSort(alarm1, alarm2) => alarm1.time.compareTo(alarm2.time);

  Future<void> _removeScheduledAlarm(AlarmDataModel alarm) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    final List<PendingNotificationRequest> pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (var notification in pendingNotificationRequests) {
      // get grouped id
      if ((notification.id / 10).floor() == alarm.id) {
        await flutterLocalNotificationsPlugin.cancel(notification.id);
      }
    }
  }

  Future<void> _scheduleAlarm(AlarmDataModel alarm) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidNotificationAction cancelAction = AndroidNotificationAction(
      'cancel_action',
      'Cancel',
      showsUserInterface: true,
    );

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alarm',
      'Alarm',
      channelDescription: 'Show the alarm',
      importance: Importance.max,
      priority: Priority.high,
      ongoing: true,
      autoCancel: false,
      actions: [
        // snoozeAction,
        cancelAction,
      ],
      sound: RawResourceAndroidNotificationSound('alarm'),
    );
    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      sound: 'alarm.aiff',
      presentSound: true,
      presentAlert: true,
      presentBadge: true,
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      alarm.id,
      // 'Alarm at ${fromTimeToString(alarm.time)}',
      alarm.title,
      'Ring Ring!!!',
      TZDateTime.local(
        alarm.time.year,
        alarm.time.month,
        alarm.time.day,
        alarm.time.hour,
        alarm.time.minute,
      ),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  void toggleAlarmActivity(int index, bool isSwitched){
    alarms![index].copyWith(
      isActive: isSwitched,
    );

    print('switched ::: $isSwitched');

    notifyListeners();

    updateAlarm(alarms![index], index);
  }
}

abstract class AlarmState {
  const AlarmState();
}

class AlarmLoading extends AlarmState{}

class AlarmLoaded extends AlarmState {
  final List<AlarmDataModel> alarms;

  const AlarmLoaded(this.alarms);
}

// state for create, update, delete,
class AlarmCreated extends AlarmState {
  final AlarmDataModel alarm;
  final int index;

  const AlarmCreated(this.alarm, this.index);
}

class AlarmDeleted extends AlarmState {
  final AlarmDataModel alarm;
  final int index;

  const AlarmDeleted(this.alarm, this.index);
}

class AlarmUpdated extends AlarmState {
  final AlarmDataModel alarm;
  final AlarmDataModel oldAlarm;
  final int index;
  final int newIndex;

  const AlarmUpdated(this.alarm, this.oldAlarm, this.index, this.newIndex);
}
