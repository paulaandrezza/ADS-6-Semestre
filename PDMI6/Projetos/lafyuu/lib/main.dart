import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/views/main/screens/explore/favorite/favorite_screen.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';
import 'views/login/login_page.dart';
import 'views/main/main_navigation_page.dart';
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
      initialRoute: AppRoutes.splash,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.splash:
            return MaterialPageRoute(builder: (_) => SplashPage());
          case AppRoutes.login:
            return MaterialPageRoute(builder: (_) => LoginPage());
          case AppRoutes.main:
            return MaterialPageRoute(builder: (_) => MainNavigationPage());
          case AppRoutes.exploreFavorites:
            return MaterialPageRoute(builder: (_) => FavoriteScreen());
          case AppRoutes.productDetails:
            final product = settings.arguments as Product;
            return MaterialPageRoute(
              builder: (_) => ProductDetailScreen(product: product),
            );
          default:
            return MaterialPageRoute(
              builder:
                  (_) => Scaffold(
                    body: Center(child: Text('Rota não encontrada')),
                  ),
            );
        }
      },
    );
  }
}
