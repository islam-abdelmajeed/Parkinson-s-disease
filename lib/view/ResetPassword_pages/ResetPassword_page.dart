import 'package:flutter/material.dart';
import 'package:graduation_project/view/ResetPassword_pages/PasswordChangedSuccessfully_page.dart';
import 'package:graduation_project/widget/CustomButton.dart';
import 'package:graduation_project/widget/CustomText.dart';
import 'package:graduation_project/widget/CustomTextField.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Image.asset("assets/resetpassword.png"),
          const SizedBox(height: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const  CustomText(
                  text: "Enter new password",
                  size: 26,
                  fontWeight: FontWeight.bold,
                  color:Color(0xff596992),
                  textAlign: TextAlign.left),

              const SizedBox(height: 10,),

              const CustomText(
                  text: "Your new password must be different from previous used passwords",
                  size: 20,
                  color:Color(0xff596992),
                  textAlign: TextAlign.left),

              const CustomTextField(
                keyBoardType: TextInputType.emailAddress,
                validateMessege: "Email is required",
                fieldLable: "",
                hintText: "Enter new password",
              ),


              const CustomTextField(
                keyBoardType: TextInputType.emailAddress,
                validateMessege: "Email is required",
                fieldLable: "",
                hintText: "Confirm password",
              ),

              const SizedBox(height: 60,),

              CustomButton(
                  fontSize: 22,
                  containerWidth: MediaQuery.of(context).size.width,
                  backgroundColor: const Color(0xff58B0CD),
                  textColor: Colors.white,
                  childText: "Send",
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>const PasswordChangedSuccefullyPage()));
                  }
              )
            ],
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
