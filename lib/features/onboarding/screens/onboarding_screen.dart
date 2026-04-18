import 'package:flutter/material.dart';
import '../../../core/theming/colors.dart';
import '../onboarding_data.dart';
import '../widgets/onboarding_background.dart';
import '../widgets/onboarding_content_box.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNextPressed() {
    if (_currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    } else {
<<<<<<< Updated upstream:lib/features/onboarding/screens/onboarding_screen.dart
      // TODO: Navigate to subsequent flow (e.g. login/home)
      debugPrint('Navigate out of onboarding!');
=======
      Navigator.of(context).pushReplacementNamed('/home');
>>>>>>> Stashed changes:lib/features/onboarding/ui/screens/onboarding_screen.dart
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          //todo: manage the state here
          setState(() {
            _currentIndex = index;
          });
        },
        itemCount: onboardingPages.length,
        itemBuilder: (context, index) {
          final data = onboardingPages[index];
          return Stack(
            children: [
              OnboardingBackground(data: data),
              OnboardingContentBox(
                data: data,
                currentIndex: _currentIndex,
                totalPages: onboardingPages.length,
                onNextPressed: _onNextPressed,
              ),
            ],
          );
        },
      ),
    );
  }
}
