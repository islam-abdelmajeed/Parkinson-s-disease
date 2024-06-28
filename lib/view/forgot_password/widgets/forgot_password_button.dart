// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../../logic/forgot_password/forgot_password_provider.dart';
// import '../../../logic/login/login_provider.dart';
// import '../../../widgets/app_elevated_button.dart';
// import '../../new_password/new_password_page.dart';
// import '../../otp/otp_page.dart';
//
// class ForgotPasswordButton extends StatelessWidget {
//   const ForgotPasswordButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppElevatedButton(
//       onPressed: () {
//         context
//             .read<ForgotPasswordProvider>()
//             .sendForgotPasswordEmail();
//
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => OtpPage(
//         //       email: context.read<LoginProvider>().emailController.text,
//         //     ),
//         //   ),
//         // );
//       },
//       label: 'Send',
//     );
//   }
// }
