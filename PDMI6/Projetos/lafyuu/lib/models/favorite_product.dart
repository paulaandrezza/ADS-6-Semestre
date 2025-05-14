import 'product.dart';
import 'package:flutter/material.dart';

class FavoriteProduct extends Product {
  final bool showDeleteIcon;
  final VoidCallback? onDelete;

  FavoriteProduct({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.price,
    required super.oldPrice,
    required super.discountPercent,
    required super.rating,
    this.showDeleteIcon = false,
    this.onDelete,
  });
}
