import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../globalData.dart';
import '../../../logic/forgot_password/forgot_password_provider.dart';
import '../../../widgets/app_elevated_button.dart';
import '../../../widgets/app_toasts.dart';
import '../../otp/otp_page.dart';
import 'forgot_password_email_input.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ForgotPasswordProvider>(
      builder: (_, value, ___) {
        // if (value.status == ForgotPasswordStatus.otpSent) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     AppToasts.success(msg: "OTP sent");
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => OtpPage(
        //           email: value.emailController.text,
        //         ),
        //       ),
        //     );
        //   });
        // }

        // if (value.status == ForgotPasswordStatus.failure) {
        //   AppToasts.error(msg: value.errorMessage ?? defaultErrorMessage);
        // }

        return Form(
          key: context.read<ForgotPasswordProvider>().formKey,
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
                          bottom: 30.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: SvgPicture.asset(
                              "assets/icons/arrow_back_ic.svg",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: SvgPicture.asset(
                          "assets/images/forgot_password.svg",
                        ),
                      ),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Reset password",
                          style: TextStyle(
                            fontSize: 22,
                            color: Color(0xff596992),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Enter the email associated with your account and we will send an email with instructions to reset your password",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff8E95A7),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const ForgotPasswordEmailInput(),
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
                  onPressed: () async {
                    await context
                        .read<ForgotPasswordProvider>()
                        .sendForgotPasswordEmail()
                        .whenComplete(() {
                      if (value.status == ForgotPasswordStatus.otpSent) {
                        AppToasts.success(msg: "OTP sent");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => OtpPage(
                              email: value.emailController.text,
                            ),
                          ),
                        );
                        return;
                      }

                      if (value.status == ForgotPasswordStatus.failure) {
                        AppToasts.error(
                            msg: value.errorMessage ?? defaultErrorMessage);
                        return;
                      }
                    });
                  },
                  label: 'Send',
                  isLoading: value.status == ForgotPasswordStatus.loading,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
