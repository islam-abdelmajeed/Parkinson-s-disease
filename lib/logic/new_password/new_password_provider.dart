import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';

import '../../Models/new_password/new_password_params.dart';
import '../../helpers/network_services.dart';
import '../../injection_container.dart';

enum NewPasswordStatus { initial, loading, failure, success }

class NewPasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmationController =
      TextEditingController();

  NewPasswordStatus _status = NewPasswordStatus.initial;

  NewPasswordStatus get status => _status;

  late String? errorMessage;

  bool _isPasswordObsecured = true;

  bool get isPasswordObsecured => _isPasswordObsecured;

  bool _isPasswordConfirmationObsecured = true;

  bool get isPasswordConfirmationObsecured => _isPasswordConfirmationObsecured;

  void togglePasswordVisibility() {
    _isPasswordObsecured = !_isPasswordObsecured;
    notifyListeners();
  }

  void togglePasswordConfirmationVisibility() {
    _isPasswordConfirmationObsecured = !_isPasswordConfirmationObsecured;
    notifyListeners();
  }

  Future<void> saveNewPassword({required final String email}) async {
    final isFormNotValid = !formKey.currentState!.validate();
    if (isFormNotValid) {
      return;
    }

    final params = NewPasswordParams(
      password: newPasswordController.text,
      confirmPassword: newPasswordConfirmationController.text,
      email: email,
    );

    _status = NewPasswordStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().resetPassword(params);
      _status = NewPasswordStatus.success;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = NewPasswordStatus.failure;
      notifyListeners();

      resetState();
    }
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? validatePasswordConfirmation(String? value) {
    if (value!.isEmpty) {
      return 'Password confirmation is required';
    }
    if (value != newPasswordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void resetState() {
    Future.delayed(const Duration(seconds: 2), () {
      _status = NewPasswordStatus.initial;
      errorMessage = null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    newPasswordConfirmationController.dispose();
    super.dispose();
  }
}
