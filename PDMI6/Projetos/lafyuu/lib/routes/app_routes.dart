enum AppRoutes {
  splash,
  signIn,
  signUp,
  main,
  sellerMain,
  exploreFavorites,
  productDetails,
  productManager,
  accountProfile,
  accountOrders,
  accountAddress,
  accountPayment,
}

extension AppRoutesExtension on AppRoutes {
  String get path {
    switch (this) {
      case AppRoutes.splash:
        return '/';
      case AppRoutes.signIn:
        return '/signIn';
      case AppRoutes.signUp:
        return '/signUp';
      case AppRoutes.main:
        return '/main';
      case AppRoutes.sellerMain:
        return '/sellerMain';
      case AppRoutes.exploreFavorites:
        return '/explore/favorites';
      case AppRoutes.productDetails:
        return '/productDetails';
      case AppRoutes.productManager:
        return '/productManager';
      case AppRoutes.accountProfile:
        return '/account/profile';
      case AppRoutes.accountOrders:
        return '/account/orders';
      case AppRoutes.accountAddress:
        return '/account/address';
      case AppRoutes.accountPayment:
        return '/account/payment';
    }
  }
}
