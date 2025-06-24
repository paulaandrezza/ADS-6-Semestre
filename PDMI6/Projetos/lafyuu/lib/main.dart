import 'package:flutter/material.dart';
import 'package:lafyuu/routes/app_router.dart';

import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

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
