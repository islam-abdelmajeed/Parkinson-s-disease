import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../logic/onboarding/onboarding_provider.dart';
import '../../../widget/CustomButton.dart';
import '../../../widget/CustomText.dart';
import '../../login/login_page.dart';

class SliderContent extends StatelessWidget {
  const SliderContent({super.key});

  @override
  Widget build(BuildContext context) {
    final slide = context
        .watch<OnboardingProvider>()
        .slides[context.watch<OnboardingProvider>().currentIndex];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 50,
      ),
      child: Column(
        children: [
          const Spacer(flex: 2),
          SvgPicture.asset(slide.image),
          const Spacer(flex: 2),
          CustomText(
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            text: slide.title,
            size: 24,
            color: const Color(0xff58B0CD),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomText(
              textAlign: TextAlign.center,
              text: slide.description,
              size: 18,
              color: const Color(0xff596992),
            ),
          ),
          const Spacer(flex: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  onPressed: () {
                    final currentIndex =
                        context.read<OnboardingProvider>().currentIndex;

                    final slides = context.read<OnboardingProvider>().slides;

                    final pageController =
                        context.read<OnboardingProvider>().pageController;

                    if (currentIndex < slides.length - 1) {
                      context
                          .read<OnboardingProvider>()
                          .setCurrentIndex(currentIndex + 1);

                      pageController.nextPage(
                        duration: const Duration(microseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  fontSize: 22,
                  textColor: Colors.white,
                  backgroundColor: const Color(0xff58B0CD),
                  childText: context
                      .read<OnboardingProvider>()
                      .slides[context.watch<OnboardingProvider>().currentIndex]
                      .buttonLabel,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
