import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';

import '../../Models/new_password/new_password_params.dart';
import '../../Models/update_password/update_password_params.dart';
import '../../helpers/network_services.dart';
import '../../injection_container.dart';

enum UpdatePasswordStatus { initial, loading, failure, success }

class UpdatePasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController newPasswordConfirmationController =
      TextEditingController();

  UpdatePasswordStatus _status = UpdatePasswordStatus.initial;

  UpdatePasswordStatus get status => _status;

  late String? errorMessage;

  bool _isOldPasswordObsecured = true;

  bool get isOldPasswordObsecured => _isOldPasswordObsecured;

  bool _isPasswordObsecured = true;

  bool get isPasswordObsecured => _isPasswordObsecured;

  bool _isPasswordConfirmationObsecured = true;

  bool get isPasswordConfirmationObsecured => _isPasswordConfirmationObsecured;

  void toggleOldPasswordVisibility() {
    _isOldPasswordObsecured = !_isOldPasswordObsecured;
    notifyListeners();
  }

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

    final params = UpdatePasswordParams(
      oldPassword: oldPasswordController.text,
      password: newPasswordController.text,
      confirmPassword: newPasswordConfirmationController.text,
      email: email,
    );

    _status = UpdatePasswordStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().updatePassword(params);
      _status = UpdatePasswordStatus.success;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = UpdatePasswordStatus.failure;
      notifyListeners();

      resetState();
    }
  }

  String? validateOldPassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    return null;
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
      _status = UpdatePasswordStatus.initial;
      errorMessage = null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    newPasswordConfirmationController.dispose();
    super.dispose();
  }
}
