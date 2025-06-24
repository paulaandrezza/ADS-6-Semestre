import 'package:flutter/material.dart';
import 'package:lafyuu/presentation/models/bottom_nav_item_data.dart';
import 'package:lafyuu/views/main/seller/tabScreens/productManager/product_manager_screen.dart';

final List<BottomNavItemData> sellerBottomNavItems = [
  BottomNavItemData(
    icon: Icons.inventory_2_outlined,
    label: 'Products',
    screen: const ProductManagerScreen(),
  ),
];
