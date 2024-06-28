import 'package:flutter/material.dart';
import 'package:graduation_project/widget/CustomText.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(25),
        border: Border.all(
          color: Colors.grey,
          width: 1.5
        )
      ),

      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 140,
              height: 130,
              decoration: const BoxDecoration(
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/michel.jpg",
                 fit: BoxFit.fill
                ),
              ),
            ),

            const SizedBox(width: 18,),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: "Dr.Dmitry levchenko", size: 19, color:Color(0xff596992), textAlign: TextAlign.center,fontWeight: FontWeight.bold,),

                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.phone,color: Color(0xff596992),),
                    CustomText(text: "+20 102 352 4801", size: 16, color: Color(0xff8E95A7), textAlign: TextAlign.center)
                  ],
                ),

                SizedBox(height: 8,),

                Row(
                  children: [
                    Icon(Icons.location_on_outlined,color: Color(0xff596992),),
                    CustomText(text: "Mansoura salam district", size: 16, color: Color(0xff8E95A7), textAlign: TextAlign.center)
                  ],
                )
              ],
            )

          ],
        ),
      )

    );
  }
}
