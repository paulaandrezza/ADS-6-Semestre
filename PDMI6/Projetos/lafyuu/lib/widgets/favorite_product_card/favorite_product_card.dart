import 'package:flutter/material.dart';
import 'package:lafyuu/models/favorite_product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';

class FavoriteProductCard extends StatelessWidget {
  final FavoriteProduct favoriteProduct;
  final VoidCallback? onDelete;
  final bool isFavorite;

  const FavoriteProductCard({
    super.key,
    required this.favoriteProduct,
    this.onDelete,
    this.isFavorite = true,
  });

  @override
  Widget build(BuildContext context) {
    print('isFavorite: ${favoriteProduct.isFavorite}');

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(product: favoriteProduct),
          ),
        );
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightgrey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                favoriteProduct.imageUrl,
                height: 160,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40,
              child: Text(
                favoriteProduct.title,
                style: AppTextStyles.body5,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (isFavorite) const SizedBox(height: 4),
            if (isFavorite)
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color:
                        index < favoriteProduct.rating
                            ? Colors.amber
                            : AppColors.lightgrey,
                    size: 14,
                  );
                }),
              ),
            const SizedBox(height: 16),
            Text(
              '\$${favoriteProduct.price.toStringAsFixed(2)}',
              style: AppTextStyles.bodyLightBlue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\$${favoriteProduct.oldPrice.toStringAsFixed(2)}',
                      style: AppTextStyles.body.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: AppColors.grey,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${favoriteProduct.discountPercent}% Off',
                      style: AppTextStyles.body.copyWith(color: Colors.red),
                    ),
                  ],
                ),

                if (isFavorite)
                  InkWell(
                    onTap: onDelete,
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.delete_outline_outlined,
                        color: AppColors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
