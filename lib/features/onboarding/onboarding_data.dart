class OnboardingData {
  final String title;
  final String description;
  final String imagePath;
  final bool isFullBleedImage;

  OnboardingData({
    required this.title,
    required this.description,
    required this.imagePath,
    this.isFullBleedImage = false,
  });
}

// Global list or just a hardcoded list for now
final List<OnboardingData> onboardingPages = [
  OnboardingData(
    title:
        'Welcome, Bestie. I hope you brought snacks.', // From the user's manual edits
    description:
        "Welcome to the big leagues. We’ve curated the best stories so you don't have to go on a space mission to find something good.",
    imagePath: 'assets/images/onboarding_background.png',
    isFullBleedImage: true,
  ),
  OnboardingData(
    title: 'That feeling when the ads finally die.', // From the Figma design
    description:
        "We hate ads more than I hate Francis. Why let a commercial break your focus when you’re busy watching a beautiful mind solve the universe.",
    imagePath: 'assets/images/onboarding_2.png',
    isFullBleedImage: false, // The second image is padded and centered
  ),
  OnboardingData(
    title: 'Resolution so high, you can see my regret.  ',
    description:
        "Why watch in potato quality when you can see every single hair on Logan’s grumpy face? We’re talking visuals so crisp they’d make a friendly neighborhood spider dizzy.",
    imagePath: 'assets/images/onboarding_3.png',
    isFullBleedImage: false,
  ),
];
