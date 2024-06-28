// import 'package:flutter/material.dart';
// import 'package:graduation_project/view/ResetPassword_pages/ResetPassword_page.dart';
// import 'package:graduation_project/widget/CustomButton.dart';
// import 'package:graduation_project/widget/CustomText.dart';
// import 'package:graduation_project/widget/CustomTextField.dart';

// class EnterYourEmail extends StatelessWidget {
//   const EnterYourEmail({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(36.0),
//         child: Column(
//           children: [
//             const Spacer(flex: 1,),
//             Image.asset("assets/enterEmail.png"),
//             const SizedBox(height: 50,),
//               Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                const  CustomText(
//                     text: "Reset password",
//                     size: 26,
//                     fontWeight: FontWeight.bold,
//                     color:Color(0xff596992),
//                     textAlign: TextAlign.left),

//                const SizedBox(height: 10,),

//                 const CustomText(
//                     text: "Enter the email associated with your account",
//                     size: 20,
//                     color:Color(0xff596992),
//                     textAlign: TextAlign.left),

//                 const CustomTextField(
//                  keyBoardType: TextInputType.emailAddress,
//                   validateMessege: "Email is required",
//                     fieldLable: "",
//                     hintText: "Enter your email",
//                 ),

//                const SizedBox(height: 60,),

//                 CustomButton(
//                   fontSize: 22,
//                     containerWidth: MediaQuery.of(context).size.width,
//                   backgroundColor: const Color(0xff58B0CD),
//                     textColor: Colors.white,
//                     childText: "Send",
//                     onPressed: (){
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context)=>const ResetPasswordPage()));
//                     }
//                 )
//               ],
//             ),
//             const Spacer(flex: 2,),
//           ],
//         ),
//       ),
//     );
//   }
// }
