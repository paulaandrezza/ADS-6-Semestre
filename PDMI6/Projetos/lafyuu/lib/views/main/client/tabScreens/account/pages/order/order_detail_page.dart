import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lafyuu/mocks/order_detail_mock.dart';
import 'package:lafyuu/mocks/products_mock.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/order/order_status_step_indicator.dart';
import 'package:lafyuu/widgets/product_card/product_card_large_list.dart';

class AccountOrderDetailPage extends StatelessWidget {
  final String orderId;
  List<Product> products = List.from(productsMock);

  AccountOrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final order = mockOrderDetail;

    return Scaffold(
      appBar: AppBar(title: const Text('Order Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderStatusStepIndicator(currentStatus: order.status),

            const SizedBox(height: 16),

            Text('Product', style: AppTextStyles.subtitle4),
            ProductCardLargeList(
              products: products,
              isOrderDetail: true,
              isScrollable: false,
            ),

            const SizedBox(height: 16),

            Text('Shipping Details:', style: AppTextStyles.subtitle4),
            Text(
              'Date: ${DateFormat('yyyy-MM-dd').format(order.shippingDate)}',
            ),
            Text('Method: ${order.shippingMethod}'),
            Text('Tracking: ${order.trackingNumber}'),
            Text('Address: ${order.address}'),

            const SizedBox(height: 16),

            Text('Payment Details:', style: AppTextStyles.subtitle4),
            Text(
              'Items total: \$${order.totalPrice - order.shippingCost - order.importCharges}',
            ),
            Text('Shipping: \$${order.shippingCost}'),
            Text('Import Charges: \$${order.importCharges}'),
            Text('Total: \$${order.totalPrice}'),
          ],
        ),
      ),
    );
  }
}
