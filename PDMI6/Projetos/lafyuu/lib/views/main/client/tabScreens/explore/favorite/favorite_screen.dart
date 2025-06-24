import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/favorite_products_mock.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_product_card/favorite_product_card_list.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<FavoriteProduct> favoriteProducts = List.from(favoriteProductsMock);

  void _removeProduct(String id) {
    setState(() {
      favoriteProducts.removeWhere((product) => product.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Products', style: AppTextStyles.h2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FavoriteProductCardList(
          favoriteProducts: favoriteProducts,
          onDelete: _removeProduct,
        ),
      ),
    );
  }
}
