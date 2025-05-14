import 'package:flutter/material.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/models/cart_product.dart';

class CartProductCard extends StatelessWidget {
  final CartProduct cartProduct;

  const CartProductCard({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.border),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Image.network(
                cartProduct.imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.contain,
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
                          cartProduct.title,
                          style: AppTextStyles.body2,
                          softWrap: true,
                        ),
                      ),
                    ),

                    IconButton(
                      icon: Icon(
                        cartProduct.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color:
                            cartProduct.isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: cartProduct.onToggleFavorite,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: cartProduct.onDelete,
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
                        style: AppTextStyles.link,
                      ),

                      Row(
                        children: [
                          GestureDetector(
                            onTap: cartProduct.onDecrement,
                            child: Container(
                              height: 32, // mesmo valor do container central
                              width: 32,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightgrey),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(Icons.remove, size: 16),
                            ),
                          ),
                          Container(
                            height: 32,
                            width: 40,
                            decoration: BoxDecoration(
                              color: AppColors.lightgrey,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${cartProduct.quantity}',
                              style: AppTextStyles.body,
                            ),
                          ),
                          GestureDetector(
                            onTap: cartProduct.onIncrement,
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.lightgrey),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: const Icon(Icons.add, size: 16),
                            ),
                          ),
                        ],
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
