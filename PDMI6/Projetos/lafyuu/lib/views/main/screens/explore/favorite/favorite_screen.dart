import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/favorite_products_mock.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_product_card/favorite_product_card_list.dart';

class FavoriteScreen extends StatelessWidget {
  final List<FavoriteProduct> favoriteProducts = favoriteProductsMock;

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products', style: AppTextStyles.title2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FavoriteProductCardList(favoriteProducts: favoriteProducts),
      ),
    );
  }
}
