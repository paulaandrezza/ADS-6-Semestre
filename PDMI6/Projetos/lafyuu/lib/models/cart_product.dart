import 'product.dart';

class CartProduct extends Product {
  int quantity;

  CartProduct({
    required super.id,
    required super.name,
    required super.description,
    required super.price,
    required super.discount,
    required super.imageUrl,
    required super.rating,
    super.isFavorite = false,
    this.quantity = 1,
  });

  CartProduct copyWith({
    int? id,
    String? title,
    String? imageUrl,
    double? price,
    int? quantity,
    bool? isFavorite,
  }) {
    return CartProduct(
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
