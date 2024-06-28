import 'package:flutter/material.dart';
import 'package:graduation_project/view/onboarding/widgets/onboarding_content.dart';

class HaveTheDiseae extends StatelessWidget {
  const HaveTheDiseae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        OnboardingContent(
            lable: "You have the disease",
            image: "assets/haveTheDiseas.png",
            onPressed: (){},
            content: "If you want to do the test again press continue",
            buttonText: "Continue",
            containerWidth: 350,

        )

    );
  }
}
