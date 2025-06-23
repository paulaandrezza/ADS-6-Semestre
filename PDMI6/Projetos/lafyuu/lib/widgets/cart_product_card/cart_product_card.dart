import 'package:flutter/material.dart';
import 'package:lafyuu/routes/app_routes.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/models/cart_product.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';
import 'package:lafyuu/widgets/favorite_button.dart';
import 'package:lafyuu/widgets/quantity_selector.dart';

class CartProductCard extends StatelessWidget {
  final CartProduct cartProduct;
  final VoidCallback? onDelete;
  final void Function(int) onQuantityChange;

  const CartProductCard({
    super.key,
    required this.cartProduct,
    this.onDelete,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightgrey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.productDetails.path,
                    arguments: cartProduct,
                  );
                },
                child: Image.network(
                  cartProduct.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          cartProduct.name,
                          style: AppTextStyles.body2,
                          softWrap: true,
                        ),
                      ),
                    ),

                    FavoriteButton(isFavorite: cartProduct.isFavorite),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: onDelete,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${cartProduct.price.toStringAsFixed(2)}',
                        style: AppTextStyles.bodyLightBlue,
                      ),

                      QuantitySelector(
                        quantity: cartProduct.quantity,
                        onQuantityChanged: onQuantityChange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
