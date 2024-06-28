import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/forgot_password/forgot_password_provider.dart';
import '../../../widgets/app_text_field.dart';

class ForgotPasswordEmailInput extends StatelessWidget {
  const ForgotPasswordEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<ForgotPasswordProvider>().emailController,
      keyboardType: TextInputType.emailAddress,
      label: 'Email',
      validator: context.read<ForgotPasswordProvider>().validateEmail,
    );
  }
}
