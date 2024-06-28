import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graduation_project/Models/registration/registration_params.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:graduation_project/helpers/network_services.dart';
import 'package:graduation_project/injection_container.dart';

enum RegistrationStatus {initial, loading, failure, registered}

class RegistrationProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phoneFocus = FocusNode();
  final FocusNode dateFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordConfirmationFocus = FocusNode();

  bool _isPasswordObsecured = true;

  bool get isPasswordObsecured => _isPasswordObsecured;

  bool _isPasswordConfirmationObsecured = true;

  bool get isPasswordConfirmationObsecured => _isPasswordConfirmationObsecured;


  RegistrationStatus _status = RegistrationStatus.initial;
  RegistrationStatus get status => _status;

  late String? errorMessage;

  Future<void> register() async {
    _status = RegistrationStatus.loading;
    notifyListeners();

    try {
      final params = RegistrationParams(
        nameController.text,
        emailController.text,
        phoneController.text,
        dateController.text,
        passwordController.text,
        passwordConfirmationController.text,
      );
      await injector<ApiService>().register(params);
      _status = RegistrationStatus.registered;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = RegistrationStatus.failure;
      notifyListeners();

      resetState();
    }
  }

  void togglePasswordVisibility() {
    _isPasswordObsecured = !_isPasswordObsecured;
    notifyListeners();
  }

  void togglePasswordConfirmationVisibility() {
    _isPasswordConfirmationObsecured = !_isPasswordConfirmationObsecured;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    dateFocus.dispose();
    passwordFocus.dispose();
    passwordConfirmationFocus.dispose();
  }

  bool get isButtonEnabled => !formKey.currentState!.validate();

  void resetState() {
    _status = RegistrationStatus.initial;
    errorMessage = null;
    notifyListeners();
  }
}
