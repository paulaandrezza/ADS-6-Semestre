import 'package:flutter/material.dart';
import 'package:lafyuu/models/cart_product.dart';
import 'cart_product_card.dart';

class CartProductCardList extends StatelessWidget {
  final List<CartProduct> cartProducts;
  final void Function(int) onDelete;
  final void Function(int id, int quantity) onQuantityChange;

  const CartProductCardList({
    super.key,
    required this.cartProducts,
    required this.onDelete,
    required this.onQuantityChange,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        final product = cartProducts[index];
        return CartProductCard(
          cartProduct: product,
          onDelete: () => onDelete(product.id),
          onQuantityChange: (q) => onQuantityChange(product.id, q),
        );
      },
    );
  }
}
