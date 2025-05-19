import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/favorite_products_mock.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'favorite_product_card.dart';

class FavoriteProductCarousel extends StatelessWidget {
  final List<FavoriteProduct> favoriteProducts = favoriteProductsMock;

  void handleDelete(int id) {}

  FavoriteProductCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: favoriteProducts.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final product = favoriteProducts[index];
          return SizedBox(
            width: 180,
            child: FavoriteProductCard(
              favoriteProduct: product,
              onDelete: () => handleDelete,
              isFavorite: false,
            ),
          );
        },
      ),
    );
  }
}
