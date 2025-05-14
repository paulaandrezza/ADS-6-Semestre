import 'package:flutter/material.dart';
import 'package:lafyuu/models/cart_product.dart';
import 'cart_product_card.dart';

class CartProductCardList extends StatelessWidget {
  final List<CartProduct> cartProducts;

  const CartProductCardList({super.key, required this.cartProducts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) {
        return CartProductCard(cartProduct: cartProducts[index]);
      },
    );
  }
}
