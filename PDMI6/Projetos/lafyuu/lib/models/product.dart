class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double discount;
  final String imageUrl;
  final int rating;
  final int? quantity;
  final bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.rating,
    this.quantity,
    this.isFavorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      discount: (json['discount'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }

  Product copyWith({
    int? id,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
    bool? isFavorite,
  }) {
    return Product(
      id: this.id,
      name: name,
      description: description,
      price: this.price,
      discount: discount,
      imageUrl: this.imageUrl,
      rating: rating,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
    );
  }
}
