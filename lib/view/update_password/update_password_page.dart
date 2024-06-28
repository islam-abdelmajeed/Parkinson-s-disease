import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../logic/new_password/new_password_provider.dart';

import '../../logic/update_password/update_password_provider.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/app_toasts.dart';

class UpdatePasswordPage extends StatelessWidget {
  final String email;

  const UpdatePasswordPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => UpdatePasswordProvider(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: UpdatePasswordForm(email: email),
          ),
        ),
      ),
    );
  }
}

class UpdatePasswordForm extends StatelessWidget {
  final String email;

  const UpdatePasswordForm({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UpdatePasswordProvider>(
      builder: (_, value, ___) {
        // if (value.status == UpdatePasswordStatus.success) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //
        //   });
        // }
        //
        // if (value.status == UpdatePasswordStatus.failure &&
        //     value.errorMessage != null) {
        //   AppToasts.error(msg: value.errorMessage ?? "");
        // }

        return Form(
          key: context.read<UpdatePasswordProvider>().formKey,
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
                            onTap: () => Navigator.pop(context),
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
                      const _OldPasswordInput(),
                      const SizedBox(height: 16),
                      const _UpdatePasswordInput(),
                      const SizedBox(height: 16),
                      const _UpdatePasswordConfirmationInput(),
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
                      .read<UpdatePasswordProvider>()
                      .saveNewPassword(email: email)
                      .whenComplete(() {
                    if (value.status == UpdatePasswordStatus.success) {
                      AppToasts.success(msg: "Password Changed");
                      Navigator.pop(context);
                      return;
                    }

                    if (value.status == UpdatePasswordStatus.failure &&
                        value.errorMessage != null) {
                      AppToasts.error(msg: value.errorMessage ?? "");
                    }
                  }),
                  label: 'Save',
                  isLoading: value.status == UpdatePasswordStatus.loading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _OldPasswordInput extends StatelessWidget {
  const _OldPasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<UpdatePasswordProvider>().oldPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: context.watch<UpdatePasswordProvider>().isOldPasswordObsecured,
      label: 'Old Password',
      suffixIcon: GestureDetector(
        onTap: context.read<UpdatePasswordProvider>().toggleOldPasswordVisibility,
        child: SvgPicture.asset(
          (context.watch<UpdatePasswordProvider>().isOldPasswordObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator: context.read<UpdatePasswordProvider>().validateOldPassword,
    );
  }
}

class _UpdatePasswordInput extends StatelessWidget {
  const _UpdatePasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context.read<UpdatePasswordProvider>().newPasswordController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: context.watch<UpdatePasswordProvider>().isPasswordObsecured,
      label: 'New Password',
      suffixIcon: GestureDetector(
        onTap: () {
          context.read<UpdatePasswordProvider>().togglePasswordVisibility();
        },
        child: SvgPicture.asset(
          (context.watch<UpdatePasswordProvider>().isPasswordObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator: context.read<UpdatePasswordProvider>().validatePassword,
    );
  }
}

class _UpdatePasswordConfirmationInput extends StatelessWidget {
  const _UpdatePasswordConfirmationInput({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: context
          .read<UpdatePasswordProvider>()
          .newPasswordConfirmationController,
      keyboardType: TextInputType.visiblePassword,
      obscureText: context
          .watch<UpdatePasswordProvider>()
          .isPasswordConfirmationObsecured,
      label: 'Password Confirmation',
      suffixIcon: GestureDetector(
        onTap: () {
          context
              .read<UpdatePasswordProvider>()
              .togglePasswordConfirmationVisibility();
        },
        child: SvgPicture.asset(
          (context
                  .watch<UpdatePasswordProvider>()
                  .isPasswordConfirmationObsecured)
              ? 'assets/icons/eye_slash_ic.svg'
              : 'assets/icons/eye_ic.svg',
        ),
      ),
      validator:
          context.read<UpdatePasswordProvider>().validatePasswordConfirmation,
    );
  }
}
