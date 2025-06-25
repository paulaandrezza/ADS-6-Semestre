import 'package:flutter/material.dart';
import 'package:lafyuu/models/product/product.dart';
import 'product_card_large.dart';

class ProductCardLargeList extends StatelessWidget {
  final List<Product> products;
  final void Function(String)? onDelete;
  final void Function(String id, int quantity)? onQuantityChange;
  final bool isOrderDetail;
  final bool isScrollable;

  const ProductCardLargeList({
    super.key,
    required this.products,
    this.onDelete,
    this.onQuantityChange,
    this.isOrderDetail = false,
    this.isScrollable = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: !isScrollable,
      physics:
          isScrollable
              ? const AlwaysScrollableScrollPhysics()
              : const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCardLarge(
          product: product,
          onDelete: onDelete != null ? () => onDelete!(product.id) : null,
          onQuantityChange:
              onQuantityChange != null
                  ? (q) => onQuantityChange!(product.id, q)
                  : null,
          isOrderDetail: isOrderDetail,
        );
      },
    );
  }
}
