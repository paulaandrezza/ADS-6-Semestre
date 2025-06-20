import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/favorite_button.dart';
import 'package:lafyuu/widgets/favorite_product_card/favorite_product_carousel.dart';
import 'package:lafyuu/widgets/primary_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name, style: AppTextStyles.h2),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: AppColors.grey),
            onPressed: () {
              // TODO: implementar search
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: AppColors.grey),
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
              spacing: 8,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.name, style: AppTextStyles.h1),
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
                              : AppColors.lightgrey,
                      size: 20,
                    );
                  }),
                ),

                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: AppTextStyles.bodyLightBlue2,
                ),

                Text('Select Size', style: AppTextStyles.body2),
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
                                      : AppColors.grey,
                            ),
                          ),
                          child: Text(
                            size,
                            style: TextStyle(
                              color: AppColors.dark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }).toList(),
                ),

                Text('Select Color', style: AppTextStyles.body2),

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

                Text('Specification', style: AppTextStyles.body2),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text('Shown:', style: AppTextStyles.body4)],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Lases', style: AppTextStyles.body),
                        Text(
                          'Blue/Anthracite/Watermelon/White',
                          style: AppTextStyles.body,
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [Text('Style:', style: AppTextStyles.body4)],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [Text('CD0113-400', style: AppTextStyles.body)],
                    ),
                  ],
                ),

                Text(
                  'The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.',
                  style: AppTextStyles.body,
                ),

                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Review Product', style: AppTextStyles.body2),
                    Text(
                      'See More',
                      style: AppTextStyles.body3.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          Icons.star,
                          color:
                              index < product.rating
                                  ? Colors.amber
                                  : AppColors.lightgrey,
                          size: 20,
                        );
                      }),
                    ),
                    Text('4.5', style: AppTextStyles.body),
                    Text('(5 reviews)', style: AppTextStyles.body),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/james.png'),
                      backgroundColor: Colors.grey.shade300,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('James Lawson', style: AppTextStyles.body),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(
                            5,
                            (i) => Icon(
                              Icons.star,
                              color: i < 4 ? Colors.amber : AppColors.lightgrey,
                              size: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Text(
                  'air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.',
                  style: AppTextStyles.body,
                ),
                Row(
                  spacing: 16,
                  children: [
                    Image.network(
                      "https://imgnike-a.akamaihd.net/768x768/01122416A1.jpg",
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Image.network(
                      "https://imgnike-a.akamaihd.net/768x768/01122416A2.jpg",
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                    Image.network(
                      "https://imgnike-a.akamaihd.net/768x768/01122416A4.jpg",
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text('December 10, 2016', style: AppTextStyles.body),

                const SizedBox(height: 8),
                Text('You Might Also Like', style: AppTextStyles.body2),
                FavoriteProductCarousel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
