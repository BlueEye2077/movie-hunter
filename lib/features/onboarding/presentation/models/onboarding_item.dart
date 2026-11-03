import '../../../../core/theming/app_strings.dart';

class OnboardingItem {
  final String title;
  final String description;
  final String imagePath;
  final bool isFullBleedImage;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isFullBleedImage = false,
  });

  static const List<OnboardingItem> pages = [
    OnboardingItem(
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDesc1,
      imagePath: 'assets/images/onboarding_background.png',
      isFullBleedImage: true,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDesc2,
      imagePath: 'assets/images/onboarding_2.png',
      isFullBleedImage: false,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDesc3,
      imagePath: 'assets/images/onboarding_3.png',
      isFullBleedImage: false,
    ),
  ];
}

