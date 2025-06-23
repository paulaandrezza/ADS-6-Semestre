import 'package:flutter/material.dart';
import 'package:lafyuu/presentation/models/menu_item_data.dart';
import 'package:lafyuu/routes/app_routes.dart';

final List<MenuItemData> accountMenuItems = [
  MenuItemData(
    icon: Icons.person,
    title: 'Profile',
    route: AppRoutes.accountProfile,
  ),
  MenuItemData(
    icon: Icons.shopping_bag,
    title: 'Orders',
    route: AppRoutes.accountOrders,
  ),
  MenuItemData(
    icon: Icons.location_on,
    title: 'Address',
    route: AppRoutes.accountAddress,
  ),
  MenuItemData(
    icon: Icons.credit_card,
    title: 'Payment',
    route: AppRoutes.accountPayment,
  ),
];
