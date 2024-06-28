import 'dart:async';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import 'alarm_params.dart';

class AlarmsHiveLocalStorage {
  static const _kAlarmsHiveBoxName = 'alarms';

  const AlarmsHiveLocalStorage();

  Future<void> init() async {
    if (!Hive.isAdapterRegistered(0)) {
      log("adapter is not registered");
      Hive.registerAdapter(AlarmDataModelAdapter());
    }

    await Hive.initFlutter();
    await Hive.openBox(_kAlarmsHiveBoxName);
    log("adapter is registered");
  }

  Future<List<AlarmDataModel>> loadAlarms() async {
    final box = Hive.box(_kAlarmsHiveBoxName);

    final List<AlarmDataModel> alarms = box.values.toList().cast();

    return Future.value(alarms);
  }

  Future<AlarmDataModel> addAlarm(AlarmDataModel alarm) async {
    final box = Hive.box(_kAlarmsHiveBoxName);

    await box.put(alarm.id, alarm);

    return alarm;
  }

  Future<AlarmDataModel> updateAlarm(AlarmDataModel alarm) async {
    final box = Hive.box(_kAlarmsHiveBoxName);

    await box.put(alarm.id, alarm);

    return alarm;
  }

  Future<void> removeAlarm(AlarmDataModel alarm) {
    final box = Hive.box(_kAlarmsHiveBoxName);

    return box.delete(alarm.id);
  }

  Future<void> dispose() async {
    await Hive.close();
  }
}
