import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widget/DoctorPageAppBar.dart';

class DiseaseDiagnosePage extends StatelessWidget {
  const DiseaseDiagnosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [

                Row(children: [
                  IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon:const Icon(Icons.arrow_back_outlined,
                        size: 30,
                        color: Colors.grey,))
                ],),

                DoctorAndDiseasPageAppBar(
                    image: "assets/dctrpg.png",
                    title: "Do you want to diagnose ",
                    secondTitle: "the disease",
                    subTitle: "Check this form and answer ",
                    secondSubTitle: "questions")

              ],
            ),
          ),
        )
    );
  }
}
