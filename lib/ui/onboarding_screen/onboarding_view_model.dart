import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:lightweaver/core/constants/app_assest.dart';
import 'package:lightweaver/ui/auth/sign_in/sign_in_screen.dart';
import 'package:lightweaver/ui/onboarding_screen/onboarding_screen.dart';

class OnboardingViewModel extends ChangeNotifier {
  final List<OnboardingItem> _items = [
    OnboardingItem(
      title: 'Vibrational Medicine at Your Fingertips',
      subtitle:
          'Explore a complete repertory of remedies aligned with energetic healing.',
      imageUrl: AppAssets().onboard2,
      stackImageUrl: AppAssets().stack1,
    ),
    OnboardingItem(
      title: 'Build Personalized Healing Formulas',
      subtitle:
          'Create and save custom blends tailored to each client\'s unique needs.',
      imageUrl: AppAssets().onboard3,
      stackImageUrl: AppAssets().stack2,
    ),
    OnboardingItem(
      title: 'Client-Centered Tools',
      subtitle:
          'Manage client profiles, track remedies, and send instructions seamlessly.',
      imageUrl: AppAssets().onboard4,
      stackImageUrl: AppAssets().stack3,
    ),
    OnboardingItem(
      title: 'Search by Symptoms, Properties, or Keywords',
      subtitle:
          'Type a word like "Exhaustion" to find all relevant remedies instantly.',
      imageUrl: AppAssets().onboard5,
      stackImageUrl: AppAssets().stack4,
    ),
    OnboardingItem(
      title: 'Safe & Synchronized',
      subtitle:
          'Your data is securely synced across devices with encrypted cloud storage.',
      imageUrl: AppAssets().onboard6,
      stackImageUrl: AppAssets().stack5,
    ),
  ];

  ///
  ///      stack images on main image in onboarding screen
  ///
  List<String> imagesList = [
    AppAssets().stack1,
    AppAssets().stack2,
    AppAssets().stack3,
    AppAssets().stack4,
    AppAssets().stack5,
  ];

  List<OnboardingItem> get items => _items;

  final PageController pageController = PageController();
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void onPageChanged(int index) {
    _currentPage = index;
    notifyListeners();
  }

  void nextPage() {
    if (_currentPage < _items.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to your main app screen
      print('Get Started action from ViewModel');
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void skip() {
    Get.to(SignInScreen());
  }
}
