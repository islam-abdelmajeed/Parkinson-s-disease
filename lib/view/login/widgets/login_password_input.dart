import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../logic/login/login_provider.dart';
import '../../../widgets/app_text_field.dart';

class LoginPasswordInput extends StatelessWidget {
  const LoginPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<LoginProvider>().passwordController,
      label: 'Password',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
      obscureText: context.watch<LoginProvider>().isPasswordObsecured,
      suffixIcon: GestureDetector(
        onTap: () {
          context.read<LoginProvider>().togglePasswordVisibility();
        },
        child: SvgPicture.asset(
          context.watch<LoginProvider>().isPasswordObsecured
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
    );
  }
}
