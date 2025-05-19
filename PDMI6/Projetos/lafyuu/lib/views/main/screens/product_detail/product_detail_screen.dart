import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_button.dart';
import 'package:lafyuu/widgets/primary_button.dart';

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(label: 'Add to Cart', onPressed: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
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
    final sizes = ['6', '6.5', '7', '7.5', '8', '8.5'];
    final colors = [
      Colors.amber,
      Colors.lightBlue,
      Colors.redAccent,
      Colors.greenAccent,
      Colors.blue,
      Colors.indigo,
    ];

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.title, style: AppTextStyles.title1),
                    FavoriteButton(isFavorite: product.isFavorite),
                  ],
                ),
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      Icons.star,
                      color:
                          index < product.rating
                              ? Colors.amber
                              : AppColors.border,
                      size: 20,
                    );
                  }),
                ),

                const SizedBox(height: 8),

                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyLightBlue2,
                ),

                const SizedBox(height: 24),

                Text('Select Size', style: AppTextStyles.body2),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      sizes.map((size) {
                        final bool isSelected = size == '7';
                        return Container(
                          width: 40,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color:
                                  isSelected
                                      ? AppColors.primary
                                      : AppColors.textSecondary,
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 24),

                Text('Select Color', style: AppTextStyles.body2),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      colors.map((color) {
                        final bool isSelected = color == Colors.amber;

                        return Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color,
                          ),
                          child:
                              isSelected
                                  ? Center(
                                    child: Container(
                                      width: 16,
                                      height: 16,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  : null,
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
