import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationNameInput extends StatelessWidget {
  const RegistrationNameInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<RegistrationProvider>().nameController,
      label: 'Username',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
    );
  }
}
