import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/view/Alarm_page.dart';
import 'package:graduation_project/widget/CustomSaveAndCancel_widget.dart';
import 'package:graduation_project/widget/CustomText.dart';
import 'package:graduation_project/widget/CustomTextField.dart';
import 'package:graduation_project/widget/CustomaAmPm.dart';
import 'package:numberpicker/numberpicker.dart';

import '../globalData.dart';

class SetAlarmPage extends StatefulWidget {
  const SetAlarmPage({super.key});

  @override
  State<SetAlarmPage> createState() => _SetAlarmPageState();
}

class _SetAlarmPageState extends State<SetAlarmPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title:const CustomText(
            fontWeight: FontWeight.bold,
            text: "Edit Alarm",
            size: 26,
            color: Color(0xff8E95A7),
            textAlign: TextAlign.center),
        ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            children: [


             // const  CustomTextField(
             //
             //      fieldLable: "Set name",
             //    fontWeight: FontWeight.bold,
             //
             //  ),


              const SizedBox(height: 60,),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 80,

                      decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey[600]!,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(2, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],

                      ),
                      child:SingleChildScrollView(
                        child: NumberPicker(
                            infiniteLoop: true,
                            selectedTextStyle: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 35
                            ),
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                border:Border(
                                  top: BorderSide(
                                      color: Colors.grey[500]!),

                                  bottom: BorderSide(
                                      color: Colors.grey[500]!),
                                )
                            ),
                            itemWidth: 80,
                            itemHeight: 90,
                            zeroPad: true,
                            minValue: 0,
                            maxValue:12,
                            value:hour,
                            onChanged:(value){
                              setState(() {
                                hour=value;

                              });

                            }),
                      )

                  ),
                  //----------------------------------------------
                  Container(
                      width: 80,
                      decoration: BoxDecoration(
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.grey[600]!,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(2, 5), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[400],

                      ),
                      child:SingleChildScrollView(
                        child: NumberPicker(
                            infiniteLoop: true,
                            selectedTextStyle: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 35
                            ),
                            textStyle: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                border:Border(
                                  top: BorderSide(
                                      color: Colors.grey[500]!),

                                  bottom: BorderSide(
                                      color: Colors.grey[500]!),
                                )
                            ),
                            itemWidth: 80,
                            itemHeight: 90,
                            zeroPad: true,
                            minValue: 0,
                            maxValue:59,
                            value:minutes,
                            onChanged:(value){
                              setState(() {
                                minutes=value;

                              });

                            }),
                      )

                  ),
                 const CustomAmPm()
                ],
              ),

              const SizedBox(height: 80,),

               Row(

                children: [
                 CustomSaveAndCancelWidget(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>const AlarmPage()));
                   },
                   borderColor: const Color(0xff83D0EA), iconColor: const Color(0xff83D0EA), lable: "Save",textColor: const Color(0xff83D0EA),icon: Icons.check,),
                 const  SizedBox(width: 200,),
                 CustomSaveAndCancelWidget(
                   onPressed: (){},
                   borderColor:  const Color(0xff8E95E7), iconColor: const Color(0xff8E95E7) , lable: "Cancel",textColor:const  Color(0xff8E95E7) ,icon: CupertinoIcons.xmark,)
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
