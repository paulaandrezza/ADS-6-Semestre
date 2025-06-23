import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/routes/app_router.dart';
import 'package:lafyuu/views/main/client/main_navigation_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/explore/favorite/favorite_screen.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';
import 'package:lafyuu/views/main/seller/seller_navigation_page.dart';
import 'package:lafyuu/views/main/seller/tabScreens/productManager/product_manager_screen.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'views/login/login_page.dart';
import 'views/splash/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layfuu E-commerce',
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splash.path,
      onGenerateRoute: generateAppRoute,
    );
  }
}
