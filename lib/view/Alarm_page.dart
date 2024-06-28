import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/globalData.dart';
import 'package:graduation_project/main.dart';
import 'package:graduation_project/view/SetAlarm_page.dart';

import '../models/Alarm_model.dart';
import '../widget/CustomText.dart';

class AlarmPage extends StatefulWidget {
  const AlarmPage({super.key});

  @override
  State<AlarmPage> createState() => _AlarmPageState();
}

class _AlarmPageState extends State<AlarmPage> {

  List<AlarmModel> alarms=[
AlarmModel(hour: hour, minutes: minutes, timeFormat: timeFormat, alarmNote: alarmNote)  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title:const CustomText(
            fontWeight: FontWeight.bold,
            text: "Your Alarm",
            size: 26,
            color: Color(0xff8E95A7),
            textAlign: TextAlign.center),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>const SetAlarmPage()));
          },
              icon:const Icon(
                  Icons.add,
                  color: primaryColor,
                  size: 35
              )
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
              Expanded(
                child: ListView(
                  children:   alarms.map((alarm) {
                    return Container(
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                          gradient: const  LinearGradient(

                              colors: [
                                Color(0xffA3CBFA),
                                Color(0xffDFE4EB)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                        child: ListTile(
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              "${alarm.hour}:${alarm.minutes}  ${alarm.timeFormat}",
                              style: const TextStyle(
                                color: Color(0xff5E6D92),
                                fontSize: 30
                              ),
                            ),
                          ),
                          subtitle: Text(
                          " ${alarm.alarmNote}",
                            style: const TextStyle(
                              color: Color(0xff8E95A7),
                              fontSize: 18
                            ),
                          ),
                          trailing: CupertinoSwitch(
                            activeColor:const Color(0xff58B0CD) ,
                            value: true,
                            onChanged: (value){},
                          ),
                        ),
                      ),

                    );
                  }).toList()
                  ,
                )
            )


          ],
        ),
      ),
    );
  }
}
