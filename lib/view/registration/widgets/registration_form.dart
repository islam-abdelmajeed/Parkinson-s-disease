import 'package:flutter/material.dart';
import 'package:graduation_project/globalData.dart';
import 'package:graduation_project/view/main/main_layout.dart';
import 'package:graduation_project/widgets/app_toasts.dart';
import 'package:provider/provider.dart';

import '../../../logic/registration/registration_provider.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_error_widget.dart';
import '../../../widgets/app_loading.dart';
import '../../../widgets/app_rich_text.dart';
import '../../login/login_page.dart';
import 'registration_date_input.dart';
import 'registration_email_input.dart';
import 'registration_name_input.dart';
import 'registration_password_confirmation_input.dart';
import 'registration_password_input.dart';
import 'registration_phone_input.dart';

class RegistrationForm extends StatelessWidget {
  const RegistrationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<RegistrationProvider>(builder: (_, value, ___) {
      // if (value.status == RegistrationStatus.failure &&
      //     value.errorMessage != null) {
      //   AppToasts.error(msg: value.errorMessage ?? defaultErrorMessage);
      // }
      return Form(
        key: context.read<RegistrationProvider>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RegistrationNameInput(),
            const SizedBox(height: 16),
            const RegistrationEmailInput(),
            const SizedBox(height: 16),
            const RegistrationPhoneInput(),
            const SizedBox(height: 16),
            const RegistrationDateInput(),
            const SizedBox(height: 16),
            const RegistrationPasswordInput(),
            const SizedBox(height: 16),
            const RegistrationPasswordConfirmationInput(),
            const SizedBox(height: 48),
            AppElevatedButton(
              onPressed: () => context
                  .read<RegistrationProvider>()
                  .register()
                  .whenComplete(() {
                if (value.status == RegistrationStatus.registered) {
                  AppToasts.success(
                      msg:
                          "Welcome ${value.nameController.text}, your account registered successfully, you need to login first");

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                  return;
                }

                if (value.status == RegistrationStatus.failure &&
                    value.errorMessage != null) {
                  AppToasts.error(
                      msg: value.errorMessage ?? defaultErrorMessage);
                  return;
                }
              }),
              label: 'Sign Up',
              isLoading: value.status == RegistrationStatus.loading,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: AppRichText(
                firstText: 'Already a member?',
                secondText: ' Login',
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      );
    });
  }
}

// class _RegisterButton extends StatelessWidget {
//   const _RegisterButton();
//
//   @override
//   Widget build(BuildContext context) {
//     return AppElevatedButton(
//       onPressed: context.read<RegistrationProvider>().register,
//       label: 'Sign In',
//       isLoading: value.status == RegistrationStatus.loading,
//     );
//   }
// }
