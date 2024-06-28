// import 'package:flutter/material.dart';
// import 'package:graduation_project/widget/CustomAppBar_widget.dart';
// import 'package:graduation_project/widget/CustomTextField.dart';

// import '../widget/CustomButton.dart';
// import '../widget/CustomText.dart';
// import 'login/login_page.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   final GlobalKey<FormState> registerKey = GlobalKey();

//   bool obscureText = true;

//   bool obscureText_2 = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xffF5F7FE),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const CustomAppBar(
//                 imageHeight: 130, imageWidth: 130, color: Color(0xffFEFEFE)),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: registerKey,
//                 autovalidateMode: autovalidateMode,
//                 child: Column(
//                   children: [
//                     const CustomTextField(
//                         fieldLable: "User name",
//                         keyBoardType: TextInputType.text,
//                         validateMessege: "user name is required"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const CustomTextField(
//                         fieldLable: "Email ",
//                         validateMessege: "this field is required"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const CustomTextField(
//                         fieldLable: "Phone number ",
//                         validateMessege: "this field is required"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const CustomTextField(
//                       fieldLable: "Birth date",
//                       keyBoardType: TextInputType.datetime,
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                         isObscure: obscureText_2,
//                         suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 obscureText_2 = !obscureText_2;
//                               });
//                             },
//                             icon: const Icon(Icons.remove_red_eye)),
//                         fieldLable: "Password",
//                         keyBoardType: TextInputType.visiblePassword,
//                         validateMessege: "this field is required"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                         isObscure: obscureText,
//                         suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 obscureText = !obscureText;
//                               });
//                             },
//                             icon: const Icon(Icons.remove_red_eye)),
//                         fieldLable: "Confirm password",
//                         keyBoardType: TextInputType.visiblePassword,
//                         validateMessege: "this field is required"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomButton(
//                         fontSize: 20,
//                         containerWidth: MediaQuery.of(context).size.width,
//                         textColor: Colors.white,
//                         backgroundColor: const Color(0xff58B0CD),
//                         childText: "Register",
//                         onPressed: () {
//                           setState(() {});
//                           if (registerKey.currentState!.validate()) {
//                             registerKey.currentState!.save();
//                           } else {
//                             autovalidateMode = AutovalidateMode.always;
//                           }
//                         }),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const CustomText(
//                             text: "Already a member?",
//                             size: 18,
//                             color: Color(0xff596992),
//                             textAlign: TextAlign.center),
//                         CustomButton(
//                             fontSize: 18,
//                             textColor: const Color(0xff58B0CD),
//                             childText: "login",
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => const LoginPage(),
//                                 ),
//                               );
//                             })
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
