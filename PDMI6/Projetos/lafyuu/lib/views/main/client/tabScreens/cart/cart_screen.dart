import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/products_mock.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/product_card/product_card_large_list.dart';
import 'package:lafyuu/widgets/primary_button.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Product> products = List.from(productsMock);

  void _removeProduct(String id) {
    setState(() {
      products.removeWhere((product) => product.id == id);
    });
  }

  void _updateQuantity(String id, int newQuantity) {
    setState(() {
      final index = products.indexWhere((product) => product.id == id);
      if (index != -1) {
        products[index] = products[index].copyWith(quantity: newQuantity);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(title: Text('Your Cart', style: AppTextStyles.h2)),
      body:
          isLandscape
              ? Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ProductCardLargeList(
                        products: products,
                        onDelete: _removeProduct,
                        onQuantityChange: _updateQuantity,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: OrderSummary(
                        totalPrice: products.fold(
                          0.0,
                          (sum, p) => sum + p.price * (p.quantity ?? 1),
                        ),
                        itemCount: products.fold(
                          0,
                          (sum, p) => sum + (p.quantity ?? 1),
                        ),
                        isLandscape: isLandscape,
                      ),
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ProductCardLargeList(
                        products: products,
                        onDelete: _removeProduct,
                        onQuantityChange: _updateQuantity,
                      ),
                    ),
                  ),
                  OrderSummary(
                    totalPrice: products.fold(
                      0.0,
                      (sum, p) => sum + p.price * (p.quantity ?? 1),
                    ),
                    itemCount: products.fold(
                      0,
                      (sum, p) => sum + (p.quantity ?? 1),
                    ),
                    isLandscape: isLandscape,
                  ),
                ],
              ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(label: 'Check Out', onPressed: () {}),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  final double totalPrice;
  final int itemCount;
  final bool isLandscape;

  const OrderSummary({
    super.key,
    required this.totalPrice,
    required this.itemCount,
    required this.isLandscape,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: EdgeInsets.all(isLandscape ? 8.0 : 16.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Coupon Code',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(8),
                      ),
                      borderSide: BorderSide(color: AppColors.lightgrey),
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 128,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.horizontal(
                        right: Radius.circular(8),
                      ),
                    ),
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () {},
                  child: Text('Apply', style: AppTextStyles.button),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.lightgrey),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Items ($itemCount)', style: AppTextStyles.body),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping', style: AppTextStyles.body),
                    Text('\$40.00', style: AppTextStyles.body),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Import Charges', style: AppTextStyles.body),
                    Text(
                      '\$${(totalPrice * 0.2).toStringAsFixed(2)}',
                      style: AppTextStyles.body,
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  height: 32,
                  color: AppColors.lightgrey,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Price', style: AppTextStyles.body2),
                    Text(
                      '\$${(totalPrice * 1.2 + 40).toStringAsFixed(2)}',
                      style: AppTextStyles.body3,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (isLandscape) {
      return SingleChildScrollView(child: content);
    } else {
      return content;
    }
  }
}
