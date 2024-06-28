import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:graduation_project/helpers/network_services.dart';
import 'package:graduation_project/injection_container.dart';

import '../../Models/otp/otp_params.dart';

enum OtpStatus { initial, loading, failure, otpSent, otpVerified }

class OtpProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final TextEditingController codeController = TextEditingController();

  OtpStatus _status = OtpStatus.initial;

  OtpStatus get status => _status;

  late String? errorMessage;

  Future<void> sendOtp(String params) async {
    _status = OtpStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().sendOtp(params);
      _status = OtpStatus.otpSent;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = OtpStatus.failure;
      notifyListeners();

      resetState();
    }
  }

  Future<void> verifyOtp(OtpParams params) async {
    _status = OtpStatus.loading;
    notifyListeners();

    try {
      await injector<ApiService>().verifyOtp(params);
      _status = OtpStatus.otpVerified;
      notifyListeners();
    } catch (error) {
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      _status = OtpStatus.failure;
      notifyListeners();

     resetState();
    }

    // Future.delayed(
    //   const Duration(milliseconds: 300),
    //       () {
    //     _status = OtpStatus.otpVerified;
    //     notifyListeners();
    //   },
    // );
  }

  bool get isButtonEnabled => codeController.text.length >= 4;

  void resetState() {
    Future.delayed(const Duration(seconds: 2), () {
      _status = OtpStatus.initial;
      errorMessage = null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    codeController.dispose();
    super.dispose();
  }
}
