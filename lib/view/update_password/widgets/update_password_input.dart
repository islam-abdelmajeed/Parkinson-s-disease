// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
//
// import '../../../logic/new_password/new_password_provider.dart';
// import '../../../widgets/app_text_field.dart';
//
// class NewPasswordInput extends StatelessWidget {
//   const NewPasswordInput({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return AppTextField(
//       controller: context.read<NewPasswordProvider>().newPasswordController,
//       keyboardType: TextInputType.visiblePassword,
//       obscureText: context.watch<NewPasswordProvider>().isPasswordObsecured,
//       label: 'New Password',
//       suffixIcon: GestureDetector(
//         onTap: () {
//           context.read<NewPasswordProvider>().togglePasswordVisibility();
//         },
//         child: SvgPicture.asset(
//           (context.watch<NewPasswordProvider>().isPasswordObsecured)
//               ? 'assets/icons/eye_slash_ic.svg'
//               : 'assets/icons/eye_ic.svg',
//         ),
//       ),
//       validator: context.read<NewPasswordProvider>().validatePassword,
//     );
//   }
// }
