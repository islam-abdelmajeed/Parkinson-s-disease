import 'package:flutter/cupertino.dart';

import 'DoctorCard.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context,index)=>SizedBox(height: 20,),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder:(context,index)=>DoctorCard(),
      itemCount: 10,);
  }
}
