import 'product.dart';

class FavoriteProduct extends Product {
  FavoriteProduct({
    required super.id,
    required super.imageUrl,
    required super.title,
    required super.price,
    required super.oldPrice,
    required super.discountPercent,
    required super.rating,
    super.isFavorite = true,
  });
}
