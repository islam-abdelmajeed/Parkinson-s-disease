import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/widgets/app_elevated_button.dart';

class ProfileUpdatedDialog extends StatelessWidget {
  const ProfileUpdatedDialog({super.key});

  static Future<void> show(BuildContext context) => showDialog(
        context: context,
        builder: (context) => const ProfileUpdatedDialog(),
      );

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      backgroundColor: const Color(0xffFEFEFE),
      // insetPadding: const EdgeInsets.all(18),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("assets/icons/success_ic.svg"),
            const SizedBox(height: 20),
            const Text(
              "Profile updated successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff596992),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Your profile has been updated successfully, we will let you know if there are any problems with your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff8E95A7),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            AppElevatedButton(
              onPressed: Navigator.of(context).pop,
              label: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
