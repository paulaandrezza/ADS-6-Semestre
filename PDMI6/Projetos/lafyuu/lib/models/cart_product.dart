import 'product.dart';

class CartProduct extends Product {
  int quantity;

  CartProduct({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.price,
    required super.oldPrice,
    required super.discountPercent,
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
      title: this.title,
      imageUrl: this.imageUrl,
      price: this.price,
      oldPrice: oldPrice,
      discountPercent: discountPercent,
      rating: rating,
      isFavorite: isFavorite ?? this.isFavorite,
      quantity: quantity ?? this.quantity,
    );
  }
}
