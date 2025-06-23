import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/routes/app_routes.dart';
import 'package:lafyuu/views/login/login_page.dart';
import 'package:lafyuu/views/main/client/main_navigation_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_address_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_orders_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_payment_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_profile_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/explore/favorite/favorite_screen.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';
import 'package:lafyuu/views/main/seller/seller_navigation_page.dart';
import 'package:lafyuu/views/main/seller/tabScreens/productManager/product_manager_screen.dart';
import 'package:lafyuu/views/splash/splash_page.dart';

Route<dynamic> generateAppRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashPage());
    case '/login':
      return MaterialPageRoute(builder: (_) => LoginPage());
    case '/main':
      return MaterialPageRoute(builder: (_) => MainNavigationPage());
    case '/sellerMain':
      return MaterialPageRoute(builder: (_) => SellerNavigationPage());
    case '/explore/favorites':
      return MaterialPageRoute(builder: (_) => FavoriteScreen());
    case '/productManager':
      return MaterialPageRoute(builder: (_) => ProductManagerScreen());
    case '/productDetails':
      final product = settings.arguments as Product;
      return MaterialPageRoute(
        builder: (_) => ProductDetailScreen(product: product),
      );
    case '/account/profile':
      return MaterialPageRoute(builder: (_) => AccountProfilePage());
    case '/account/orders':
      return MaterialPageRoute(builder: (_) => AccountOrdersPage());
    case '/account/address':
      return MaterialPageRoute(builder: (_) => AccountAddressPage());
    case '/account/payment':
      return MaterialPageRoute(builder: (_) => AccountPaymentPage());
    default:
      return MaterialPageRoute(
        builder:
            (_) => const Scaffold(
              body: Center(child: Text('Rota não encontrada')),
            ),
      );
  }
}
