import 'dart:ui';

import 'product.dart';

class CartProduct extends Product {
  int quantity;
  bool isFavorite;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;
  final VoidCallback? onDelete;
  final VoidCallback? onToggleFavorite;

  CartProduct({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.price,
    required super.oldPrice,
    required super.discountPercent,
    required super.rating,
    this.quantity = 1,
    this.isFavorite = false,
    this.onIncrement,
    this.onDecrement,
    this.onDelete,
    this.onToggleFavorite,
  });
}
