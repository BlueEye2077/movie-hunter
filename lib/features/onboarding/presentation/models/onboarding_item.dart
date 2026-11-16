import '../../../../core/theming/app_assets.dart';
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
      imagePath: AppAssets.onboardingBackgroundPng,
      isFullBleedImage: true,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDesc2,
      imagePath: AppAssets.onboarding2Png,
      isFullBleedImage: false,
    ),
    OnboardingItem(
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDesc3,
      imagePath: AppAssets.onboarding3Png,
      isFullBleedImage: false,
    ),
  ];
}

