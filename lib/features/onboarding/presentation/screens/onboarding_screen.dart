import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/helpers/shared_preference_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../models/onboarding_item.dart';
import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_content_box.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  static const List<OnboardingItem> _pages = OnboardingItem.pages;
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() async {
    if (_currentIndex < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
      await SharedPreferenceHelper.saveSeenOnBoarding();
      isSeenOnBoarding = true;
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed(Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: _pages.length,
        itemBuilder: (context, index) {
          final data = _pages[index];
          return Stack(
            children: [
              OnboardingBackground(data: data),
              OnboardingContentBox(
                data: data,
                currentIndex: _currentIndex,
                totalPages: _pages.length,
                onNextPressed: _onNextPressed,
              ),
            ],
          );
        },
      ),
    );
  }
}
