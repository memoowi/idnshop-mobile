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
          imageUrl: 'https://i.ibb.co.com/VCYgdN1/shirt.png',
          title: 'Shirt',
          rating: 3.0,
          price: 35000,
          sold: 2,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/9gGdTjc/pants.png',
          title: 'Pants',
          rating: 5.0,
          price: 25000,
          sold: 1,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/8zzc9M0/sweater.png',
          title: 'Sweater',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/3SpLWds/cap.png',
          title: 'Cap',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/xXY8VYv/shoes.png',
          title: 'Shoes',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/X4FyjqG/backpak.png',
          title: 'Backpack',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/RjWN7dq/sunglasess.png',
          title: 'Sunglasses',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
        ProductData(
          imageUrl: 'https://i.ibb.co.com/cxX73Rf/umbrella.png',
          title: 'Umbrella',
          rating: 4.5,
          price: 50000,
          sold: 3,
        ),
      ];
}
