import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title, style: AppTextStyles.title2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.textSecondary),
            onPressed: () {
              // TODO: implementar search
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.textSecondary),
            onPressed: () {
              // TODO: implementar opções
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ProductDetailScreenBody(product: product),
    );
  }
}

class ProductDetailScreenBody extends StatefulWidget {
  final Product product;

  const ProductDetailScreenBody({super.key, required this.product});

  @override
  State<ProductDetailScreenBody> createState() =>
      _ProductDetailScreenBodyState(product: product);
}

class _ProductDetailScreenBodyState extends State<ProductDetailScreenBody> {
  final Product product;

  _ProductDetailScreenBodyState({required this.product});

  @override
  Widget build(BuildContext context) {
    print('isFavorite: ${product.isFavorite}');
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRect(
            child: Center(
              child: Image.network(
                product.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title, style: AppTextStyles.title1),
                    FavoriteButton(isFavorite: product.isFavorite),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
