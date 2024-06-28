import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_text_field.dart';

class RegistrationPhoneInput extends StatelessWidget {
  const RegistrationPhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<RegistrationProvider>().phoneController,
      keyboardType: TextInputType.phone,
      label: 'Phone number',
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number is required';
        }
        return null;
      },
    );
  }
}
