import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graduation_project/helpers/error/error_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../helpers/network_services.dart';
import '../../injection_container.dart';
import '../../widgets/app_toasts.dart';

enum ProfileStatus { initial, loading, failure, loaded, updated, updateLoading }

class ProfileProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  File? _pickedAvatarFile;

  File? get pickedAvatarFile => _pickedAvatarFile;

  String? _imageUrl;

  String? get imageUrl => _imageUrl;

  DateTime? _selectedDate;

  DateTime? get selectedDate => _selectedDate;

  ProfileStatus _status = ProfileStatus.initial;

  ProfileStatus get status => _status;

  late String? errorMessage;

  String? validate(String? value) {
    if (value!.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  void pickAvatar() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      _pickedAvatarFile = File(pickedFile.path);
      notifyListeners();
    } else {
      AppToasts.error(msg: "Failed to pick an image, please try again");
    }
  }

  void pickDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1850),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
    );

    if (pickedDate != null) {
      _selectedDate = pickedDate;
      notifyListeners();
    } else {
      AppToasts.error(msg: "Failed to pick date, please try again");
    }
  }

  Future<void> getProfileData({required int id}) async {
    _status = ProfileStatus.loading;
    notifyListeners();

    try {
      // TODO: Implement login logic
      final result = await injector<ApiService>().getProfileData(
        id: id,
      );

      _imageUrl = result.avatar!;
      nameController.text = result.username!;
      emailController.text = result.email!;
      phoneController.text = result.phoneNumber!;
      _selectedDate = DateTime.tryParse(result.birthDate!);

      _status = ProfileStatus.loaded;
      notifyListeners();
    } catch (error) {
      log("profile error ::: $error");
      _status = ProfileStatus.failure;
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      notifyListeners();

      resetState();
    }
  }

  Future<void> updateProfile({required int id}) async {
    _status = ProfileStatus.updateLoading;
    notifyListeners();

    try {
      await injector<ApiService>().updateProfile(
        id: id,
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        birthDate: DateFormat("yyyy-MM-dd").format(_selectedDate ?? DateTime.now()),
        avatar: _pickedAvatarFile,
      );

      _status = ProfileStatus.updated;
      notifyListeners();
    } catch (error) {
      _status = ProfileStatus.failure;
      errorMessage = ErrorHandler.handle(error).apiErrorModel.message;
      notifyListeners();
    }
  }

  void resetState() {
    _status = ProfileStatus.initial;
    errorMessage = null;
    notifyListeners();
  }
}
