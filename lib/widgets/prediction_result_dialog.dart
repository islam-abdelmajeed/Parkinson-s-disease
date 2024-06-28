import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/app_elevated_button.dart';

class PredictionResultDialog extends StatelessWidget {
  final bool? hasTheDisease;

  const PredictionResultDialog({
    super.key,
    this.hasTheDisease,
  });

  static Future<void> show(BuildContext context, {required final hasTheDisease}) => showDialog(
        context: context,
        builder: (context) => PredictionResultDialog(
          hasTheDisease: hasTheDisease,
        ),
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
            Text(
              (hasTheDisease != null && hasTheDisease == true) ? "Parkinson" : "Healthy",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff596992),
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
             Text(
               (hasTheDisease != null && hasTheDisease == true) ? "You have the disease" : "You don't have the disease",
              textAlign: TextAlign.center,
              style: const TextStyle(
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
