import 'package:flutter/material.dart';

import '../../../widget/CustomButton.dart';
import '../../../widget/CustomText.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
    required this.lable,
    required this.image,
    required this.onPressed,
    required this.content,
    this.containerWidth,
    required this.buttonText,
  });

  final String lable;
  final String image;
  final VoidCallback onPressed;
  final String content;
  final double? containerWidth;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 50,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 3,
            ),
            Center(
              child: Image.asset(
                image,
                width: 265,
                height: 220,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            CustomText(
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              text: lable,
              size: 26,
              color: const Color(0xff58B0CD),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomText(
                textAlign: TextAlign.center,
                text:
                    "The app offers exercises for patients with parkinson’s disease",
                size: 20,
                color: Color(0xff596992),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  containerWidth: containerWidth,
                  onPressed: onPressed,
                  fontSize: 22,
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff58B0CD),
                  childText: buttonText,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
