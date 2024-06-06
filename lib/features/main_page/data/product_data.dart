class ProductData {
  final String imageUrl;
  final String title;
  final double rating;
  final int price;
  final int sold;

  ProductData({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.price,
    required this.sold,
  });

  static List<ProductData> get products => [
        ProductData(
          imageUrl: 'https://i.ibb.co/9gGdTjc/pants.png',
          title: 'Pants',
          rating: 3.0,
          price: 35000,
          sold: 2,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co/3SpLWds/cap.png',
          title: 'BaseballBaseball Love Cap',
          rating: 5.0,
          price: 25000,
          sold: 1,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co/3SpLWds/cap.png',
          title: 'Shoes',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co/3SpLWds/cap.png',
          title: 'Shoes',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co/3SpLWds/cap.png',
          title: 'Shoes',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
      ];
}
