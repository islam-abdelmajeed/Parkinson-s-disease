import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../logic/onboarding/onboarding_provider.dart';
import 'widgets/slider_content.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class SliderObject {
  final String image;
  final String title;
  final String description;
  final String buttonLabel;

  const SliderObject(
    this.image,
    this.title,
    this.description,
    this.buttonLabel,
  );
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = context.read<OnboardingProvider>().pageController;
  }

  @override
  Widget build(BuildContext context) {
    final slides = context.read<OnboardingProvider>().slides;
    final currentIndex = context.watch<OnboardingProvider>().currentIndex;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          PageView.builder(
            itemCount: slides.length,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => const SliderContent(),
          ),
          Positioned(
            top: 400.h,
            child: AnimatedSmoothIndicator(
              count: slides.length,
              activeIndex: currentIndex,
              effect: WormEffect(
                activeDotColor: const Color(0xff58B0CD),
                dotColor: const Color(0xffB0B7BF),
                dotWidth: 10.w,
                dotHeight: 10.h,
                radius: 10.w,
                paintStyle: PaintingStyle.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
