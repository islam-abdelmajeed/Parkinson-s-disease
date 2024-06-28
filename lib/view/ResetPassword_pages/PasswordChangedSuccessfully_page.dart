import 'package:flutter/material.dart';
import 'package:graduation_project/widget/CustomButton.dart';
import 'package:graduation_project/widget/CustomText.dart';

class PasswordChangedSuccefullyPage extends StatelessWidget {
  const PasswordChangedSuccefullyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          children: [
            const Spacer(flex: 1,),
            Image.asset("assets/trueSign.png"),
            const SizedBox(height: 50,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const  CustomText(
                    text: "Password changed successfully!",
                    size: 26,
                    fontWeight: FontWeight.bold,
                    color:Color(0xff596992),
                    textAlign: TextAlign.center),

                const SizedBox(height: 50,),

                const CustomText(
                    text: "Your password has been changed successfully,we will let you know if there are more problems with your account",
                    size: 20,
                    color:Color(0xff596992),
                    textAlign: TextAlign.center),


                const SizedBox(height: 100,),

                CustomButton(
                    fontSize: 22,
                    containerWidth: MediaQuery.of(context).size.width,
                    backgroundColor: const Color(0xff58B0CD),
                    textColor: Colors.white,
                    childText: "Continue",
                    onPressed: (){

                    }
                )
              ],
            ),
            const Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
