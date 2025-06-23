import 'package:flutter/material.dart';
import 'package:lafyuu/routes/app_routes.dart';

class MenuItemData {
  final IconData icon;
  final String title;
  final AppRoutes route;

  MenuItemData({required this.icon, required this.title, required this.route});
}
