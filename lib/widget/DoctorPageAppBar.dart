import 'package:flutter/cupertino.dart';
import 'package:graduation_project/widget/CustomText.dart';

class DoctorAndDiseasPageAppBar extends StatelessWidget {
  const DoctorAndDiseasPageAppBar({super.key, required this.image, required this.title, required this.subTitle, required this.secondSubTitle,  this.secondTitle});

  final String image;
  final String title;
  final String? secondTitle;

  final String subTitle;
  final String secondSubTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: const  LinearGradient(

              colors: [
                Color(0xffA3CBFA),
                Color(0xffDFE4EB)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
          )
      ),
      
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
              image,
              width: 120,
              height: 120,
          ),

           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: title, size:22, color: Color(0xff596992), textAlign: TextAlign.center),

              CustomText(text: secondTitle!, size:22, color: Color(0xff596992), textAlign: TextAlign.center),


              SizedBox(height: 12,),
              CustomText(text: subTitle, size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.center,fontWeight: FontWeight.bold,),
              CustomText(text: secondSubTitle, size: 18, color: Color(0xff8E95A7), textAlign: TextAlign.left,fontWeight: FontWeight.bold,)

            ],
          )
        ],
      ),
    );
  }
}
