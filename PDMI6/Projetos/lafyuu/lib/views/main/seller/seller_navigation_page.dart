import 'package:flutter/material.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/views/main/client/tabScreens/account/account_screen.dart';
import 'package:lafyuu/views/main/seller/tabScreens/productManager/product_manager_screen.dart';

class SellerNavigationPage extends StatefulWidget {
  const SellerNavigationPage({super.key});

  @override
  State<SellerNavigationPage> createState() => _SellerNavigationPageState();
}

class _SellerNavigationPageState extends State<SellerNavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProductManagerScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap:
            (index) => setState(() {
              _currentIndex = index;
            }),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
