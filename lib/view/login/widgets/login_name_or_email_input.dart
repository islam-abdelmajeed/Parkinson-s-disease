import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/login/login_provider.dart';
import '../../../widgets/app_text_field.dart';

class LoginNameOrEmailInput extends StatelessWidget {
  const LoginNameOrEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<LoginProvider>().emailController,
      label: 'Username Or Email',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username or Email is required';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
