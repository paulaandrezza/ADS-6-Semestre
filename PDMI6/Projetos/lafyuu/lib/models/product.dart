class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String imageUrl;
  final int rating;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.rating,
    this.isFavorite = false,
  });
}
