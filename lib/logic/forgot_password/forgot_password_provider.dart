import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';

import '../../helpers/network_services.dart';
import '../../injection_container.dart';

enum ForgotPasswordStatus { initial, loading, failure, otpSent }

class ForgotPasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordStatus _status = ForgotPasswordStatus.initial;

  ForgotPasswordStatus get status => _status;

  late String? errorMessage;

  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    return null;
  }

  Future<bool> sendForgotPasswordEmail() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    _status = ForgotPasswordStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().sendOtp(emailController.text);

      _status = ForgotPasswordStatus.otpSent;
      notifyListeners();
      return true;
    } catch (error) {
      _status = ForgotPasswordStatus.failure;
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      notifyListeners();

      resetState();
      return false;
    }

  //   Future.delayed(
  //     const Duration(milliseconds: 500),
  //     () {
  //       _status = ForgotPasswordStatus.otpSent;
  //       notifyListeners();
  //       print("<<<<<<<<< status::: $_status>>>>>>>>>>>");
  //       return true;
  //       },
  //   );
  //
  //   return false;
  }

  void resetState() {
    Future.delayed(const Duration(seconds: 2), () {
      _status = ForgotPasswordStatus.initial;
      errorMessage = null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
