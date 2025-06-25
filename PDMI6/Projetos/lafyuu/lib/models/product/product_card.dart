class ProductCard {
  final String id;
  final String name;
  final double price;
  final double discount;
  final String imageUrl;
  final int? rating;
  final int? quantity;
  final bool isFavorite;

  ProductCard({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.imageUrl,
    this.rating,
    this.quantity,
    this.isFavorite = false,
  });

  factory ProductCard.fromJson(Map<String, dynamic> json) {
    return ProductCard(
      id: json['id'],
      name: json['name'],
      price: 200.0,
      discount: 0.1,
      rating: 3 as int?,
      // price: (json['price'] as num).toDouble(),
      // discount: (json['discount'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      // rating: json['rating'],
      isFavorite: json['isFavorite'] ?? false,
    );
  }
}
