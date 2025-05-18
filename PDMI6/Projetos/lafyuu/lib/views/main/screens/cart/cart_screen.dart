import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/cart_products_mock.dart';
import 'package:lafyuu/models/cart_product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/cart_product_card/cart_product_card_list.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartProduct> cartProducts = List.from(cartProductsMock);

  void _removeProduct(int id) {
    setState(() {
      cartProducts.removeWhere((product) => product.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart', style: AppTextStyles.title2)),
      body:
          isLandscape
              ? Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CartProductCardList(
                        cartProducts: cartProducts,
                        onDelete: _removeProduct,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OrderSummary(totalPrice: 1235.50, itemCount: 10),
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CartProductCardList(
                        cartProducts: cartProducts,
                        onDelete: _removeProduct,
                      ),
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
  final int itemCount;

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
