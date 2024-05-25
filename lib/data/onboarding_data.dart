class OnboardingItem {
  String image;
  String title;
  String desc;
  OnboardingItem({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<OnboardingItem> imgList = [
  OnboardingItem(
      image: 'assets/images/logo_without_text.png',
      title: 'Welcome To Diabetless',
      desc:
          'Empower Your Health with Diabetless: Your Ultimate Diabetes Management Companion.'),
  OnboardingItem(
      image: 'assets/images/camera.png',
      title: 'Glycemic Index Camera',
      desc:
          'Capture your meal and see the glycemic index and nutritional facts.'),
  OnboardingItem(
      image: 'assets/images/meal_planner.png',
      title: 'Meal Planner',
      desc:
          'See many healthy recipes with nutritional facts and add it to your daily meal plan.'),
  OnboardingItem(
      image: 'assets/images/blood_sugar.png',
      title: 'Health Tracker',
      desc: 'You can track your blood sugar level and body composition.'),
  OnboardingItem(
      image: 'assets/images/health_articles.png',
      title: 'Health Articles',
      desc: 'Keep yourself updated with the latest health articles.'),
];
