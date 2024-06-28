import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationEmailInput extends StatelessWidget {
  const RegistrationEmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<RegistrationProvider>().emailController,
      keyboardType: TextInputType.emailAddress,
      label: 'Email',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );
  }
}
