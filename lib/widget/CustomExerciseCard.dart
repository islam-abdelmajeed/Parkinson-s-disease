import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widget/CustomText.dart';

class CustomExerciseCard extends StatelessWidget {
  const CustomExerciseCard({super.key, required this.lable, required this.image, required this.description});

  final String lable;
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 35,
            color: Color(0xffFEFEFE),
            child:CustomText(text: lable, size: 20, color: Color(0xff596992), textAlign: TextAlign.center)
          ),
          SizedBox(height: 3,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: Image.asset(
                image,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
            ),

          ),
          SizedBox(
              width: 280,
              child: CustomText(text: description, size: 16, color: Color(0xff9BA1B2), textAlign: TextAlign.center))
        ],
      ),
    );
  }
}
