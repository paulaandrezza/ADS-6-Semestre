import 'package:flutter/material.dart';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/views/main/client/main_navigation_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_address_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/account_payment_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/order/account_order_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/order/order_detail_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/pages/profile/account_profile_page.dart';
import 'package:lafyuu/views/main/client/tabScreens/explore/favorite/favorite_screen.dart';
import 'package:lafyuu/views/main/screens/product_detail/product_detail_screen.dart';
import 'package:lafyuu/views/main/seller/seller_navigation_page.dart';
import 'package:lafyuu/views/main/seller/tabScreens/productManager/product_manager_screen.dart';
import 'package:lafyuu/views/sign/sign_in_page.dart';
import 'package:lafyuu/views/sign/sign_up_page.dart';
import 'package:lafyuu/views/splash/splash_page.dart';

Route<dynamic> generateAppRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (_) => SplashPage());
    case '/signIn':
      return MaterialPageRoute(builder: (_) => SignInPage());
    case '/signUp':
      return MaterialPageRoute(builder: (_) => SignUpPage());
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
    case '/account/order':
      return MaterialPageRoute(builder: (_) => AccountOrderPage());
    case '/account/order/details':
      final orderId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (_) => AccountOrderDetailPage(orderId: orderId),
      );
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
