import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/favorite_products_mock.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_product_card/favorite_product_card_list.dart';
import 'package:lafyuu/widgets/under_construction.dart';

class ProductManagerScreen extends StatefulWidget {
  const ProductManagerScreen({super.key});

  @override
  State<ProductManagerScreen> createState() => _ProductManagerScreenState();
}

class _ProductManagerScreenState extends State<ProductManagerScreen> {
  List<FavoriteProduct> favoriteProducts = List.from(favoriteProductsMock);
  final TextEditingController _searchController = TextEditingController();

  // TODO: remover metodo removeProduct quando back estiver conectado, deixar direto no card do produtos
  void _removeProduct(int id) {
    setState(() {
      favoriteProducts.removeWhere((product) => product.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Product',
            prefixIcon: Icon(Icons.search, color: AppColors.primary),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: AppColors.grey),
            onPressed: () {
              // TODO: implementar notificação
            },
          ),
          SizedBox(width: 16),
        ],
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
