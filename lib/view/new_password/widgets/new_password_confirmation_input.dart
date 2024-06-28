import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../logic/new_password/new_password_provider.dart';
import '../../../widgets/app_text_field.dart';

class NewPasswordConfirmationInput extends StatelessWidget {
  const NewPasswordConfirmationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context
          .read<NewPasswordProvider>()
          .newPasswordConfirmationController,
      keyboardType: TextInputType.visiblePassword,
      obscureText:
          context.watch<NewPasswordProvider>().isPasswordConfirmationObsecured,
      label: 'Password Confirmation',
      suffixIcon: GestureDetector(
        onTap: () {
          context
              .read<NewPasswordProvider>()
              .togglePasswordConfirmationVisibility();
        },
        child: SvgPicture.asset(
          (context.watch<NewPasswordProvider>().isPasswordConfirmationObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator: context.read<NewPasswordProvider>().validatePasswordConfirmation,
    );
  }
}
