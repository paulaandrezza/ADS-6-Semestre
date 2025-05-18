import 'dart:ui';

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
}
