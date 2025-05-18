import 'package:flutter/material.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;

  const QuantitySelector({super.key, this.initialQuantity = 1});

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _decrement,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
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
              child: const Icon(Icons.remove, size: 16),
            ),
          ),
        ),

        Container(
          height: 32,
          width: 40,
          decoration: BoxDecoration(color: AppColors.lightgrey),
          alignment: Alignment.center,
          child: Text('$quantity', style: AppTextStyles.body2),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _increment,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4),
            ),
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
        ),
      ],
    );
  }
}
