import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/logic/otp/otp_provider.dart';
import 'package:graduation_project/view/new_password/new_password_page.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../Models/otp/otp_params.dart';
import '../../globalData.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_toasts.dart';

class OtpPage extends StatelessWidget {
  final String email;

  const OtpPage({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => OtpProvider(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Consumer<OtpProvider>(
                builder:
                    (BuildContext context, OtpProvider value, Widget? child) {
                  // if (value.status == OtpStatus.otpVerified) {
                  //   WidgetsBinding.instance.addPostFrameCallback((_) {
                  //     AppToasts.success(msg: "OTP verified");
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => const NewPasswordPage(),
                  //       ),
                  //     );
                  //   });
                  // }

                  // if (value.status == OtpStatus.otpSent) {
                  //   AppToasts.success(msg: "OTP Sent");
                  // }
                  //
                  // if (value.status == OtpStatus.failure &&
                  //     value.errorMessage != null) {
                  //   AppToasts.error(
                  //       msg: value.errorMessage ?? defaultErrorMessage);
                  // }

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 16.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: GestureDetector(
                            onTap: () => Navigator.of(context).popUntil((route) => route.isFirst),
                            child: SvgPicture.asset(
                              "assets/icons/arrow_back_ic.svg",
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 100.0,
                          bottom: 40.0,
                        ),
                        child: SvgPicture.asset(
                          "assets/images/otp_header.svg",
                        ),
                      ),
                      const Text(
                        "OTP Verification",
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xff596992),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          text: "We have sent code to ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xff8E95A7),
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: email,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color(0xff596992),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const TextSpan(
                              text: " to verify your registration",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff8E95A7),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 50),
                      OtpPinCode(),
                      const SizedBox(height: 40),
                      RichText(
                        text: TextSpan(
                          text: 'Haven’t got the code yet? ',
                          style: const TextStyle(
                            color: Color(0xff596992),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          children: [
                            TextSpan(
                              text: 'Resend Code',
                              style: const TextStyle(
                                color: Color(0xff58B0CD),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context
                                      .read<OtpProvider>()
                                      .sendOtp(email)
                                      .whenComplete(() {
                                    if (value.status == OtpStatus.otpSent) {
                                      AppToasts.success(msg: "OTP Sent");
                                      return;
                                    }

                                    if (value.status == OtpStatus.failure &&
                                        value.errorMessage != null) {
                                      AppToasts.error(
                                          msg: value.errorMessage ??
                                              defaultErrorMessage);
                                      return;
                                    }
                                  });
                                },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 70.0,
                          bottom: 40,
                        ),
                        child: AppElevatedButton(
                          onPressed: () {
                            final params = OtpParams(
                              email: email,
                              code: value.codeController.text,
                            );
                            context
                                .read<OtpProvider>()
                                .verifyOtp(params)
                                .then((_) {
                              if (value.status == OtpStatus.otpVerified) {
                                AppToasts.success(msg: "OTP verified");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        NewPasswordPage(
                                          email: email,
                                        ),
                                  ),
                                );
                                return;
                              }

                              if (value.status == OtpStatus.failure &&
                                  value.errorMessage != null) {
                                AppToasts.error(
                                    msg: value.errorMessage ??
                                        defaultErrorMessage);
                              }
                            });
                          },
                          label: 'Submit',
                          isLoading: value.status == OtpStatus.loading,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class OtpPinCode extends StatelessWidget {
  OtpPinCode({super.key});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      color: const Color(0xffF2F4F7),
      border: Border.all(
        color: const Color(0xffD7D7D7),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Pinput(
      controller: context.watch<OtpProvider>().codeController,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: defaultPinTheme.copyDecorationWith(
        color: const Color(0xffFFFFFF),
        border: Border.all(
          color: const Color(0xff58B0CD),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      submittedPinTheme: defaultPinTheme.copyDecorationWith(
        color: const Color(0xffFFFFFF),
        border: Border.all(
          color: const Color(0xff58B0CD),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      separatorBuilder: (index) => const SizedBox(width: 10),
      onChanged: (value) =>
          context.read<OtpProvider>().codeController.text = value,
      validator: (value) {
        if (value!.isEmpty) {
          return "Code shouldn't be empty";
        } else if (value.length < 6) {
          return "Code length must be 6 digits";
        }
        return null;
      },
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
    );
  }
}
