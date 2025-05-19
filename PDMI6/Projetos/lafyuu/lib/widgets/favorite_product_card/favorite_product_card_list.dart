import 'package:flutter/material.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'favorite_product_card.dart';

class FavoriteProductCardList extends StatelessWidget {
  final List<FavoriteProduct> favoriteProducts;
  final void Function(int) onDelete;

  const FavoriteProductCardList({
    super.key,
    required this.favoriteProducts,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isLandscape ? 4 : 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: isLandscape ? 0.60 : 0.55,
      ),
      itemCount: favoriteProducts.length,
      itemBuilder: (context, index) {
        final favoriteProduct = favoriteProducts[index];
        return FavoriteProductCard(
          favoriteProduct: favoriteProduct,
          onDelete: () => onDelete(favoriteProduct.id),
        );
      },
    );
  }
}
