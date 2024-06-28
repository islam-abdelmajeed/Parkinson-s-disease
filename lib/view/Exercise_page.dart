import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widget/CustomExerciseCard.dart';

import '../widget/CustomText.dart';

class ExercisePage extends StatelessWidget {
  const ExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
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
                const CustomText(text: "Exercises", size: 28, color: Color(0xff8E95A7), textAlign: TextAlign.center),
                const Spacer(flex: 2),
              ],
            ),

            CustomExerciseCard(
              lable: "Flex the hand",
              image: "assets/flexHand.png",
              description: "Extend the right and left arms forward, interlock them together, and extend them forward until you feel a slight stretch for 15 to 30 seconds.",
            ),
            //-----------------------------------------------

            CustomExerciseCard(
                lable: "Strengthening the hand nerves",
                image: "assets/strengthHandNerve.png",
                description: "Extend your right arm in front of you with your palm facing the floor, then bend your wrist with your fingertips pointing toward the floor."),

            //------------------------------------------------

            CustomExerciseCard(
                lable: "Strengthen the hand ",
                image: "assets/strengthHand.png",
                description: "")
          ],
        ),
      ),

    );
  }
}
