import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/helpers/clock_helper.dart';
import 'package:graduation_project/logic/alarm/alarm_provider.dart';
import 'package:graduation_project/view/add_or_edit_alarm/add_or_edit_alarm_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({super.key});

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alarm"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddOrEditAlarmScreen(
                    isEditing: false,
                  ),
                ),
              );
            },
            icon: SvgPicture.asset("assets/icons/add_ic.svg"),
          ),
        ],
      ),
      body: Consumer<AlarmModel>(
        builder: (context, value, child) {
          if (value.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xff58B0CD),
              ),
            );
          }
          return ListView.builder(
            itemCount: value.alarms?.length ?? 0,
            padding: const EdgeInsets.symmetric(vertical: 10),
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              bool isActive = false;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddOrEditAlarmScreen(
                        isEditing: true,
                        alarm: value.alarms![index],
                        index: index,
                      ),
                    ),
                  );
                },
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: const Text("Do you want to delete this alarm?"),
                      actions: [
                        OutlinedButton(
                          onPressed: Navigator.of(context).pop,
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: Colors.red
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              side: BorderSide(
                                color: Color(0xff58B0CD),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: Color(0xff58B0CD), fontSize: 18),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => context
                              .read<AlarmModel>()
                              .deleteAlarm(value.alarms![index], index)
                              .whenComplete(Navigator.of(context).pop),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 20,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xffDAEAFD),
                          Color(0xffF1F4FF),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.12, 2],
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: DateFormat("hh:mm a")
                                    .format(value.alarms![index].time),
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: Color(0xff5E6D92),
                                  fontWeight: FontWeight.w600,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ", ${fromWeekdayToStringShort(value.alarms![index].day)}",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: Color(0xff8E95A7),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Switch(
                              value: value.alarms![index].isActive,
                              onChanged: (value) {
                                Provider.of<AlarmModel>(context, listen: false)
                                    .toggleAlarmActivity(index, value);
                              },
                              activeColor: Colors.white,
                              activeTrackColor: const Color(0xff58B0CD),
                              inactiveTrackColor: const Color(0xffF5F7FE),
                              inactiveThumbColor: const Color(0xff8E95A7),
                            )
                          ],
                        ),
                        Text(
                          value.alarms![index].title,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xff8E95A7),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )),
              );
            },
          );
        },
      ),
    );
  }
}
