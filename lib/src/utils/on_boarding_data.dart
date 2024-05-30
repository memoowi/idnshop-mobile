class OnBoardingData {
  final String image;
  final String title;
  final String description;

  const OnBoardingData({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnBoardingData> get items => [
        OnBoardingData(
          image: "assets/images/chara-1.png",
          title: "Welcome to IDNShop",
          description:
              "Designed with care, enjoyed with confidence. Affordable prices for everyday needs.",
        ),
        OnBoardingData(
          image: "assets/images/chara-2.png",
          title: "Explore a Diverse Range of Products",
          description:
              "Discover high-quality IDN merchandise across diverse categories. Find something unique for every occasion and express your personal style.",
        ),
        OnBoardingData(
          image: "assets/images/chara-3.png",
          title: "Pure Choices, Pure Delight",
          description:
              "Experience the joy of Halal Living. Shop confidently with our ethically sourced and produced products.",
        ),
      ];
}
