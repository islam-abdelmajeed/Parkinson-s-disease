import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduation_project/Models/login/login_params.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:graduation_project/injection_container.dart';

import '../../globalData.dart';
import '../../helpers/network_services.dart';

enum LoginStatus { initial, loading, failure, loggedIn }

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginStatus _status = LoginStatus.initial;

  LoginStatus get status => _status;

  bool _isPasswordObsecured = true;

  bool get isPasswordObsecured => _isPasswordObsecured;

  late String? errorMessage;

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    _status = LoginStatus.loading;
    notifyListeners();

    try {
      final params = LoginParams(
        emailController.text,
        passwordController.text,
      );

      // TODO: Implement login logic
      final result = await injector<ApiService>().login(params);

      // TODO: save token globally to use it later
      token = result.token!;
      id = result.id!;

      _status = LoginStatus.loggedIn;
      notifyListeners();
      return true;
    } catch (error) {
      _status = LoginStatus.failure;
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      notifyListeners();
      return false;
    }
  }

  void togglePasswordVisibility() {
    _isPasswordObsecured = !_isPasswordObsecured;
    notifyListeners();
  }

  bool get isButtonEnabled => !formKey.currentState!.validate();

  void resetState() {
    _status = LoginStatus.initial;
    errorMessage = null;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
