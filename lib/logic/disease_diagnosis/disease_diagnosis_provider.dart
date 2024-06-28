import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:image_picker/image_picker.dart';

import '../../helpers/network_services.dart';
import '../../injection_container.dart';
import '../../widgets/app_toasts.dart';

enum DiseaseDiagnosisStatus { initial, loading, failure, success }

class DiseaseDiagnosisProvider extends ChangeNotifier {
  File? _pickedImageFile;

  File? get pickedImageFile => _pickedImageFile;

  DiseaseDiagnosisStatus _status = DiseaseDiagnosisStatus.initial;

  DiseaseDiagnosisStatus get status => _status;

  late String? errorMessage;

  String? resultLabel;

  void pickImage({required final ImageSource source}) async {
    final pickedFile =
    await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      _pickedImageFile = File(pickedFile.path);
      notifyListeners();
    } else {
      AppToasts.error(msg: "Failed to pick an image, please try again");
    }
  }

  Future<void> predictDisease() async {
    _status = DiseaseDiagnosisStatus.loading;
    notifyListeners();

    try {
      final result = await injector<ApiService>().predictDisease(
        _pickedImageFile!,
      );

       if(result[0].score! > result[1].score!){
         resultLabel = result[0].label;
       }else{
         resultLabel = result[0].label;
       }

       print(">>>> result: $resultLabel");

      _status = DiseaseDiagnosisStatus.success;
      notifyListeners();
    } catch (error) {
      _status = DiseaseDiagnosisStatus.failure;
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      notifyListeners();

      resetState();
    }
  }


  void resetState() {
    _status = DiseaseDiagnosisStatus.initial;
    errorMessage = null;
    notifyListeners();
  }
}
