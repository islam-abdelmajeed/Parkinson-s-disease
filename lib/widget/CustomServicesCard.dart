import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/main.dart';

class CustomServiceCard extends StatelessWidget {
  const CustomServiceCard({super.key, required this.image, required this.lable, required this.onTap});

  final String image;
  final String lable;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20),

          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                image,
                  width: 120,
                  height: 130
                    ,),

                Text(
                    lable,
                style:const  TextStyle(
                  color: Color(0xff596992),
                  fontSize: 18,

                ),
                )

              ],
            ),
          ),
        ),
    );
  }
}
