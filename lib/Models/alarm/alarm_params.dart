import 'dart:math';

import 'package:hive/hive.dart';

part 'alarm_params.g.dart';

@HiveType(typeId: 0)
class AlarmDataModel {
  @HiveField(0)
  late final int id;
  @HiveField(1)
  final DateTime time;
  @HiveField(2)
  final int day;
  @HiveField(3)
  final String title;
  @HiveField(4)
  late final bool isActive;


  AlarmDataModel({
    int? id,
    required this.time,
    required this.day,
    required this.title,
    bool? isActive,
  }) {
    this.id = id ?? Random.secure().nextInt(10000 - 1000) + 1000;
    this.isActive = isActive ?? true;
  }

  AlarmDataModel copyWith({
    int? id,
    DateTime? time,
    int? day,
    String? title,
    bool? isActive,
  }) =>
      AlarmDataModel(
        id: id ?? this.id,
        time: time ?? this.time,
        day: day ?? this.day,
        title: title ?? this.title,
        isActive: isActive ?? this.isActive,
      );
}
