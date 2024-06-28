import 'package:flutter/material.dart';
import 'package:graduation_project/widget/CustomText.dart';

class InstructionPage extends StatelessWidget {
  const InstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(

            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:const Icon(Icons.arrow_back_outlined,
                        size: 30,
                        color: Colors.grey,)),
                  const Spacer(flex: 1),
                  const CustomText(text: "Instructions", size: 28, color: Color(0xff8E95A7), textAlign: TextAlign.center),
                  const Spacer(flex: 2),
                ],
              ),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    const CustomText(text: "Learn how to use the glove", size: 24, color: Color(0xff596992), textAlign: TextAlign.left,fontWeight: FontWeight.bold,),

                    Container(
                      width: double.infinity,
                      height: 200,
                      child: Image.asset("assets/gloves inst.png"),
                    ),

                    const CustomText(text: "The instruction to be followed to use the gloves:", size: 20, color: Color(0xff596992), textAlign: TextAlign.left,),

                    //----------------------------------------------------------------------------------

                    SizedBox(height: 20,),
                   const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: "1.Consult with a healthcare professional:", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: " Before using any assistive device,including Parkinson's gloves, it's essentialto consult with a healthcare professional.", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------

                        CustomText(text: "2.Choose the right glove:", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: " There are various types of gloves designed for Parkinson's patients, and each may serve a different purpose. Some focus on reducing tremors, while others may assist with hand dexterity or other specificissues.", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------


                        CustomText(text: "3.Learn how to put on the glove:", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: " Some gloves may have specific instructions for putting them on. Follow these instructions carefully to ensure the glove is positioned correctly.", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------


                        CustomText(text: "4.Calibrate the device:", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: "If your glove has adjustable settings or calibration features, work with a healthcare professional or a technician to calibrate it to your specific needs. Proper calibration can significantly improve the effectiveness of the device.", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------


                        CustomText(text: "5.Practice and training:", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: "Using Parkinson's gloves effectively often requires practice. Work with a physical therapist or occupational therapist to learn how to use the glove correctly and get the most benefit from it. ", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------

                        CustomText(text: "6.Monitor and adjust: ", size: 18, color: Color(0xff596992), textAlign: TextAlign.left,),
                        CustomText(text: "Over time, your needs and symptoms may change. Be prepared to monitor your progress and adjust the settings or usage of the glove as necessary. Regularly communicate with your healthcare provider about your experiences and any changes in your condition", size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,),
                        SizedBox(height: 16,),
                        //---------------------------------------------


                      ],
                    ),






                  ],
                ),
              )
            ],
          ),
        ),
      ),

    );
  }
}
