import 'package:flutter/material.dart';
import 'package:lafyuu/views/main/screens/explore/favorite/favorite_screen.dart';

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
      routes: {
        AppRoutes.splash: (_) => SplashPage(),
        AppRoutes.login: (_) => LoginPage(),
        AppRoutes.main: (_) => MainNavigationPage(),
        AppRoutes.exploreFavorites: (_) => FavoriteScreen(),
      },
    );
  }
}
