class onBoardingModel {
  final String imagePath;

  final String body;

  onBoardingModel({
    required this.imagePath,
    required this.body,
  });
}

List<onBoardingModel> getOnBoardingList() {
  return [
    onBoardingModel(
      imagePath: 'assets/images/onboarding_1.png',
      body:
          'Analyze your social media interactions to uncover your emotional state—happiness, stress, or loneliness.',
    ),
    onBoardingModel(
      imagePath: 'assets/images/onboarding_2.png',
      body:
          'Receive personalized content suggestions like videos, books, or activities to boost your well-being.',
    ),
    onBoardingModel(
      imagePath: 'assets/images/onboarding_3.png',
      body:
          'Easily connect with licensed therapists for additional support whenever you need it.',
    ),
  ];
}
