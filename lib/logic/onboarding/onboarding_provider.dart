import 'package:flutter/material.dart';

import '../../view/onboarding/onboarding_page.dart';

class OnboardingProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  final _pageController = PageController();
  PageController get pageController => _pageController;

  final _slides = const <SliderObject>[
    SliderObject(
      "assets/images/slider_1.svg",
      "Track hand vibrations",
      "Periodic monitoring of the patient’s condition by tracking hand vibrations on a graph",
      "Next",
    ),
    SliderObject(
      "assets/images/slider_2.svg",
      "Exercise",
      "The app offers exercises for patients with parkinson’s disease",
      "Next",
    ),
    SliderObject(
      "assets/images/slider_3.svg",
      "Privacy",
      "keep patient information strictly confidential",
      "Get started",
    ),
  ];

  List<SliderObject> get slides => _slides;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
