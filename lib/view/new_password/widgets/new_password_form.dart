import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/view/login/login_page.dart';
import 'package:graduation_project/widgets/app_loading.dart';
import 'package:provider/provider.dart';

import '../../../logic/new_password/new_password_provider.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_toasts.dart';
import 'new_password_button.dart';
import 'new_password_confirmation_input.dart';
import 'new_password_input.dart';

class NewPasswordForm extends StatelessWidget {
  final String email;
  const NewPasswordForm({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NewPasswordProvider>(
      builder: (_, value, ___) {
        // if (value.status == NewPasswordStatus.success) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //
        //   });
        // }
        //
        // if (value.status == NewPasswordStatus.failure &&
        //     value.errorMessage != null) {
        //   AppToasts.error(msg: value.errorMessage ?? "");
        // }

        return Form(
          key: context.read<NewPasswordProvider>().formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context)
                                .popUntil((route) => false),
                            child: SvgPicture.asset(
                              "assets/icons/arrow_back_ic.svg",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30.0,
                          bottom: 40.0,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/new_password.svg",
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter new password",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff596992),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Your new password must be different from previous used passwords",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff8E95A7),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const NewPasswordInput(),
                      const SizedBox(height: 16),
                      const NewPasswordConfirmationInput(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 40.0,
                ),
                child: AppElevatedButton(
                  onPressed: () => context
                      .read<NewPasswordProvider>()
                      .saveNewPassword(email: email)
                      .whenComplete(() {
                    if (value.status == NewPasswordStatus.success) {
                      AppToasts.success(msg: "Password Changed");
                      Navigator.popUntil(context, (route) => route.isFirst);
                      return;
                    }

                    if (value.status == NewPasswordStatus.failure &&
                        value.errorMessage != null) {
                      AppToasts.error(msg: value.errorMessage ?? "");
                    }
                  }),
                  label: 'Save',
                  isLoading: value.status == NewPasswordStatus.loading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
