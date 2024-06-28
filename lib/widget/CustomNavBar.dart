import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../view/Alarm_page.dart';
import '../view/QrCode_page.dart';
import '../view/home_Page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, });

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int index=0;

  final screens=[
    const HomePage(),
    const QrCodePage(),
    const AlarmPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(


          backgroundColor: Colors.white,
          color:primaryColor,
          animationDuration:const  Duration(milliseconds: 400),
          index: index,
          onTap: (index){
            setState(() {
              this.index=index;
            });
          },


          items: const [
            CurvedNavigationBarItem(

              child: Icon(Icons.home,color: Color(0xff58B0CD),size: 32,),
              label: 'Home',
              labelStyle:TextStyle(
                  color: Color(0xff58B0CD),
                  fontSize: 18,
                  fontWeight: FontWeight.bold

              ),
            ),

            CurvedNavigationBarItem(
                child: Icon(Icons.qr_code,color: Color(0xff58B0CD),size: 32,),
                label: 'Qr',
                labelStyle:TextStyle(
                    color: Color(0xff58B0CD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                )
            ),


            CurvedNavigationBarItem(
                child: Icon(Icons.alarm,color: Color(0xff58B0CD),size: 32,),
                label: 'Alarm',
                labelStyle:TextStyle(
                    color: Color(0xff58B0CD),
                    fontSize: 18,
                    fontWeight: FontWeight.bold

                )
            ),



          ],),

    )
    ;
  }
}
