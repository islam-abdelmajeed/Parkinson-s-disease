import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/globalData.dart';
import 'package:graduation_project/logic/profile/profile_provider.dart';
import 'package:graduation_project/view/main/main_layout.dart';
import 'package:graduation_project/widgets/app_elevated_button.dart';
import 'package:graduation_project/widgets/app_error_widget.dart';
import 'package:graduation_project/widgets/app_toasts.dart';
import 'package:graduation_project/widgets/profile_updated_dialog.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/app_loading.dart';
import '../update_password/update_password_page.dart';

class ProfileItem {
  final String label;
  final String value;

  const ProfileItem({
    required this.label,
    required this.value,
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isEditingProfile = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/icons/arrow_right_ic.svg"),
        ),
      ),
      body: ChangeNotifierProvider(
        create: (context) => ProfileProvider()..getProfileData(id: id),
        child: Consumer<ProfileProvider>(
          builder: (context, value, child) {
            if (value.status == ProfileStatus.loading) {
              return const AppLoading();
            }

            if (value.status == ProfileStatus.failure &&
                value.errorMessage != null) {
              return AppErrorWidget(
                msg: value.errorMessage ?? defaultErrorMessage,
                onRetry: context.read<ProfileProvider>().resetState,
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  // CircleAvatar(
                  //   radius: 40,
                  //   backgroundColor: Colors.grey,
                  //   backgroundImage: (value.pickedAvatarFile != null)
                  //       ? FileImage(value.pickedAvatarFile!)
                  //       : const NetworkImage(
                  //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3vrTUU3CKbUDThpm8aZzFXdTmai6PodNfXA&s")
                  //           as ImageProvider,
                  // ),
                  GestureDetector(
                    onTap: (_isEditingProfile) ? value.pickAvatar : null,
                    child: Container(
                      height: 100,
                      width: 100,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      child: (value.pickedAvatarFile != null)
                          ? Image.file(
                              value.pickedAvatarFile!,
                              fit: BoxFit.cover,
                            )
                          : Image.network(
                              value.imageUrl!,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                height: 100,
                                width: 100,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: Image.network(
                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3vrTUU3CKbUDThpm8aZzFXdTmai6PodNfXA&s"),
                              ),
                            ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value.nameController.text,
                    style: const TextStyle(
                      color: Color(0xff5E6D92),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isEditingProfile = !_isEditingProfile;
                      });
                    },
                    child: const Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Edit profile",
                          style: TextStyle(
                            color: Color(0xffD7D7D7),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.edit,
                          color: Color(0xffD7D7D7),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileItemInput(
                        label: "Name",
                        value: value.nameController.text,
                        controller: value.nameController,
                        isEditingProfile: _isEditingProfile,
                      ),
                      Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: const Color(0xffE0E0E0),
                      ),
                      ProfileItemInput(
                        label: "Email",
                        value: value.emailController.text,
                        controller: value.emailController,
                        isEditingProfile: _isEditingProfile,
                      ),
                      Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: const Color(0xffE0E0E0),
                      ),
                      ProfileItemInput(
                        label: "Phone Number",
                        value: value.phoneController.text,
                        controller: value.phoneController,
                        isEditingProfile: _isEditingProfile,
                      ),
                      Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: const Color(0xffE0E0E0),
                      ),
                      ProfileItemInput(
                        label: "Birth Date",
                        value: (value.selectedDate == null)
                            ? ""
                            : DateFormat("yyyy/MM/dd")
                                .format(value.selectedDate!),
                        isEditingProfile: _isEditingProfile,
                        isDate: true,
                      ),
                      Container(
                        height: 1.0,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        color: const Color(0xffE0E0E0),
                      ),
                      if (_isEditingProfile == false)
                        AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Password",
                                  style: TextStyle(
                                    color: Color(0xff596992),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Text(
                                      "*********",
                                      style: TextStyle(
                                        color: Color(0xff8E95A7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: () {
                                        // showModalBottomSheet(
                                        //   context: context,
                                        //   isScrollControlled: true,
                                        //   useRootNavigator: true,
                                        //   useSafeArea: true,
                                        //   isDismissible: false,
                                        //   shape: const RoundedRectangleBorder(
                                        //     borderRadius: BorderRadius.only(
                                        //       topLeft: Radius.circular(25),
                                        //       topRight: Radius.circular(25),
                                        //     )
                                        //   ),
                                        //   builder: (context) => const Column(
                                        //     mainAxisSize: MainAxisSize.min,
                                        //     children: [
                                        //
                                        //     ],
                                        //   ),
                                        // );

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UpdatePasswordPage(
                                              email: value.emailController.text,
                                            ),
                                          ),
                                        );
                                      },
                                      child: const Text(
                                        "Update",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff596992),
                                          decoration: TextDecoration.underline,
                                          decorationColor: Color(0xff596992),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  if (_isEditingProfile) ...[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30.0,
                        right: 30.0,
                        bottom: 40.0,
                      ),
                      child: AppElevatedButton(
                        onPressed: () =>
                            value.updateProfile(id: id).whenComplete(() {
                          if (value.status == ProfileStatus.updated) {
                            ProfileUpdatedDialog.show(context);
                            setState(() {
                              _isEditingProfile = !_isEditingProfile;
                            });
                          }
                        }),
                        label: "Save",
                        isLoading: value.status == ProfileStatus.updateLoading,
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileItemInput extends StatelessWidget {
  const ProfileItemInput({
    super.key,
    required this.label,
    required this.value,
    this.controller,
    required bool isEditingProfile,
    this.isDate = false,
    this.isPassword = false,
  }) : _isEditingProfile = isEditingProfile;

  final String label;
  final String value;
  final TextEditingController? controller;
  final bool _isEditingProfile;
  final bool? isDate;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff596992),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          if (_isEditingProfile)
            if (isDate != null && isDate == true)
              GestureDetector(
                onTap: () => context.read<ProfileProvider>().pickDate(context),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined,
                        color: Color(0xff58B0CD),
                        size: 15,
                      ),
                      const SizedBox(width: 16),
                      Text(
                        value,
                        style: const TextStyle(
                          color: Color(0xff8E95A7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            else
              TextFormField(
                controller: controller,
                // initialValue: value,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              )
          else
            Text(
              value,
              style: const TextStyle(
                color: Color(0xff8E95A7),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
    );
  }
}
