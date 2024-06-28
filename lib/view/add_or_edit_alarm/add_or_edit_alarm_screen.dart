import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/Models/alarm/alarm_params.dart';
import 'package:graduation_project/helpers/clock_helper.dart';
import 'package:graduation_project/logic/alarm/alarm_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';

import '../../globalData.dart';
import '../../widgets/app_text_field.dart';

class AddOrEditAlarmScreen extends StatefulWidget {
  final bool isEditing;
  final AlarmDataModel? alarm;
  final int? index;

  const AddOrEditAlarmScreen({
    super.key,
    required this.isEditing,
    this.alarm,
    this.index,
  });

  @override
  State<AddOrEditAlarmScreen> createState() => _AddOrEditAlarmScreenState();
}

class _AddOrEditAlarmScreenState extends State<AddOrEditAlarmScreen> {
  late final TextEditingController _titleController;
  late final _formKey = GlobalKey<FormState>();

  final _weekDays = <int>[
    0,
    1,
    2,
    3,
    4,
    5,
    6,
  ];

  int _selectedDayIndex = 0;
  int _selectedHourIndex = 0;
  int _selectedMinuteIndex = 0;

  // late String _selectedTimeType;
  late TimeFormat _timeFormat;

  @override
  void initState() {
    super.initState();

    _titleController = TextEditingController();
    _timeFormat = (widget.alarm?.time != null)
        ? (widget.alarm!.time.hour > 12)
            ? TimeFormat.pm
            : TimeFormat.am
        : TimeFormat.am;

    _titleController.text = widget.alarm?.title ?? "";
    _selectedDayIndex = widget.alarm?.day ?? 0;
    _selectedHourIndex = ((widget.alarm?.time != null)
        ? (widget.alarm!.time.hour > 12)
            ? widget.alarm!.time.hour - 12
            : widget.alarm?.time.hour
        : DateTime.now().hour - 12)!;
    _selectedMinuteIndex = widget.alarm?.time.minute ?? DateTime.now().minute;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
        ),
        title: Text((widget.isEditing) ? "Edit Alarm" : "Add Alarm"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: AppTextField(
                    controller: _titleController,
                    label: 'Alarm Title',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alarm title is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                  ),
                ),
                Container(
                  height: 60,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 13,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xffE9EAF1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                    border: Border.all(
                      color: const Color(0xff9F9191).withOpacity(0.2),
                    ),
                  ),
                  child: ListView.separated(
                    itemCount: _weekDays.length,
                    scrollDirection: Axis.horizontal,
                    physics: const ClampingScrollPhysics(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDayIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: (_selectedDayIndex == index)
                              ? const Color(0xffD8E6FB)
                              : null,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Text(
                          // _weekDays[index],
                          fromWeekdayToStringShort(_weekDays[index]),
                          style: (_selectedDayIndex == index)
                              ? const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff8E95A7),
                                  fontWeight: FontWeight.w600,
                                )
                              : const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff8E95A7),
                                  fontWeight: FontWeight.w400,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE9EAF1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                        border: Border.all(
                          color: const Color(0xff9F9191).withOpacity(0.2),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: NumberPicker(
                            infiniteLoop: true,
                            selectedTextStyle: TextStyle(
                              color: Colors.grey[600],
                              // (0xff8E95A7)
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                            textStyle: const TextStyle(
                              color: Color(0xff8E95A7),
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: const BoxDecoration(
                              border: Border(
                                top: BorderSide(color: Color(0xffE0E0E0)),
                                bottom: BorderSide(color: Color(0xffE0E0E0)),
                              ),
                            ),
                            itemWidth: 80,
                            itemHeight: 90,
                            zeroPad: true,
                            minValue: 0,
                            maxValue: 12,
                            value: _selectedHourIndex,
                            onChanged: (value) {
                              setState(() {
                                _selectedHourIndex = value;
                              });
                            }),
                      ),
                    ),
                    //----------------------------------------------
                    Container(
                        width: 80,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE9EAF1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(24),
                          ),
                          border: Border.all(
                            color: const Color(0xff9F9191).withOpacity(0.2),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: NumberPicker(
                              infiniteLoop: true,
                              selectedTextStyle: TextStyle(
                                color: Colors.grey[600],
                                // (0xff8E95A7)
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                              textStyle: const TextStyle(
                                color: Color(0xff8E95A7),
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Color(0xffE0E0E0)),
                                  bottom: BorderSide(color: Color(0xffE0E0E0)),
                                ),
                              ),
                              itemWidth: 80,
                              itemHeight: 90,
                              zeroPad: true,
                              minValue: 0,
                              maxValue: 59,
                              value: _selectedMinuteIndex,
                              onChanged: (value) {
                                setState(() {
                                  _selectedMinuteIndex = value;
                                });
                              }),
                        )),
                    // const CustomAmPm()
                    Container(
                      width: 70,
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xffD8E6FB),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (_timeFormat == TimeFormat.pm) {
                                  setState(() {
                                    _timeFormat = TimeFormat.am;
                                  });
                                }
                              },
                              child: Text(
                                "AM",
                                style: TextStyle(
                                  color: _timeFormat == TimeFormat.am
                                      ? const Color(0xff58B0CD)
                                      : const Color(0xff596992),
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_timeFormat == TimeFormat.am) {
                                  setState(() {
                                    // timeFormat = "AM";
                                    _timeFormat = TimeFormat.pm;
                                  });
                                }
                              },
                              child: Text(
                                "PM",
                                style: TextStyle(
                                  color: _timeFormat == TimeFormat.pm
                                      ? const Color(0xff58B0CD)
                                      : const Color(0xff596992),
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 80,
                    left: 50,
                    right: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            final alarm = AlarmDataModel(
                              time: DateTime(
                                DateTime.now().year,
                                DateTime.now().month,
                                DateTime.now().day,
                                (_timeFormat == TimeFormat.am)
                                    ? _selectedHourIndex
                                    : _selectedHourIndex + 12,
                                _selectedMinuteIndex,
                              ),
                              day: _selectedDayIndex,
                              title: _titleController.text,
                            );

                            log(alarm.time.toString());
                            log(fromWeekdayToString(alarm.day));
                            log(alarm.title.toString());
                            // log(alarm.time.toString());
                            // log(_timeFormat.fromTimeFormatToString());
                            if (widget.isEditing) {
                              log("update");
                              context
                                  .read<AlarmModel>()
                                  .updateAlarm(alarm, widget.index!)
                                  .whenComplete(
                                    () => Navigator.pop(context),
                                  );
                            } else {
                              log("add");
                              context
                                  .read<AlarmModel>()
                                  .addAlarm(alarm)
                                  .whenComplete(
                                    () => Navigator.pop(context),
                                  );
                            }

                            // Provider.of<AlarmModel>(context, listen: false)
                            //     .addAlarm(alarm);
                          }
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset("assets/icons/save_alarm_ic.svg"),
                            const SizedBox(height: 10),
                            const Text(
                              "Save",
                              style: TextStyle(
                                color: Color(0xff83D0EA),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.popUntil(
                          context,
                          (route) => false,
                        ),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                                "assets/icons/cancel_alarm_ic.svg"),
                            const SizedBox(height: 10),
                            const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Color(0xff8E95A7),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
