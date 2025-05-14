import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/cart_products_mock.dart';
import 'package:lafyuu/models/cart_product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/cart_product_card/cart_product_card_list.dart'; // Crie esse arquivo como vimos antes

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<CartProduct> cartProducts = cartProductsMock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Cart', style: AppTextStyles.title2)),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CartProductCardList(cartProducts: cartProducts),
            ),
          ),
          OrderSummary(totalPrice: 1235.50, itemCount: 10),
        ],
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final double totalPrice;
  final int itemCount; // Exemplo de contagem de itens

  const OrderSummary({
    super.key,
    required this.totalPrice,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Items ($itemCount)', style: AppTextStyles.body),
                  Text('\$598.88', style: AppTextStyles.body),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Shipping', style: AppTextStyles.body),
                  Text('\$40.00', style: AppTextStyles.body),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Import Charges', style: AppTextStyles.body),
                  Text('\$128.00', style: AppTextStyles.body),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price', style: AppTextStyles.body2),
                  Text('\$766.86', style: AppTextStyles.body3),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
