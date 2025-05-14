class Product {
  final int id;
  final String imageUrl;
  final String title;
  final double price;
  final double oldPrice;
  final int discountPercent;
  final int rating;

  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.discountPercent,
    required this.rating,
  });
}
