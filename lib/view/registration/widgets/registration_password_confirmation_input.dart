import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationPasswordConfirmationInput extends StatelessWidget {
  const RegistrationPasswordConfirmationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller:
          context.read<RegistrationProvider>().passwordConfirmationController,
      keyboardType: TextInputType.visiblePassword,
      obscureText:
          context.watch<RegistrationProvider>().isPasswordConfirmationObsecured,
      label: 'Password Confirmation',
      suffixIcon: GestureDetector(
        onTap: () {
          context
              .read<RegistrationProvider>()
              .togglePasswordConfirmationVisibility();
        },
        child: SvgPicture.asset(
          (context.watch<RegistrationProvider>().isPasswordConfirmationObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password Confirmation is required';
        }
        return null;
      },
    );
  }
}
