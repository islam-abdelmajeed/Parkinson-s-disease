import 'package:flutter/material.dart';
import 'package:graduation_project/widget/DoctorListView.dart';
import 'package:graduation_project/widget/DoctorPageAppBar.dart';

class DoctorPage extends StatelessWidget {
  const DoctorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body:
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children:  [

                Row(children: [
                 IconButton(
                     onPressed: (){
                       Navigator.pop(context);
                     },
                     icon:const Icon(Icons.arrow_back_outlined,
                     size: 30,
                     color: Colors.grey,))
                ],),

               const  DoctorAndDiseasPageAppBar(
                   image: "assets/dctrpg.png",
                   title: "Looking for a doctor?",
                   secondTitle: "",
                   subTitle: "Check the list of the best",
                   secondSubTitle: "nearest doctors"),

               const DoctorsListView()


              ],
            ),
          ),
        ),
      )

      ,


    );
  }
}
