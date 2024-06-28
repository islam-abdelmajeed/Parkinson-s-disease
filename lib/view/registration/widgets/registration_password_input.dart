import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationPasswordInput extends StatelessWidget {
  const RegistrationPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<RegistrationProvider>().passwordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: context.watch<RegistrationProvider>().isPasswordObsecured,
      label: 'Password',
      suffixIcon: GestureDetector(
        onTap: () {
          context.read<RegistrationProvider>().togglePasswordVisibility();
        },
        child: SvgPicture.asset(
          (context.watch<RegistrationProvider>().isPasswordObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }
}
