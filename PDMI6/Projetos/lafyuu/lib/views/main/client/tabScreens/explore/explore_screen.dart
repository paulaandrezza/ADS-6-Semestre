import 'package:flutter/material.dart';
import 'package:lafyuu/mocks/products_mock_search.dart';
import 'package:lafyuu/models/category_data.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/views/main/client/tabScreens/explore/favorite/favorite_screen.dart';
import 'package:lafyuu/widgets/category_grid.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchText = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> filteredProducts =
        mockProducts
            .where((product) => product.toLowerCase().contains(_searchText))
            .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search Product',
            prefixIcon: Icon(Icons.search, color: AppColors.primary),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_outline_outlined, color: AppColors.grey),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => FavoriteScreen()));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: AppColors.grey),
            onPressed: () {
              // TODO: implementar notificação
            },
          ),
          SizedBox(width: 16),
        ],
      ),
      body:
          _searchText.isEmpty
              ? ExploreBody()
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      filteredProducts[index],
                      style: AppTextStyles.body,
                    ),
                  );
                },
              ),
    );
  }
}

class ExploreBody extends StatelessWidget {
  final List<CategoryData> manCategories = [
    CategoryData(icon: Icons.checkroom, label: 'Man Shirt'),
    CategoryData(icon: Icons.engineering, label: 'Work Equipment'),
    CategoryData(icon: Icons.emoji_people, label: 'Man T-Shirt'),
    CategoryData(icon: Icons.shopping_bag, label: 'Man Shoes'),
    CategoryData(icon: Icons.fireplace, label: 'Man Pants'),
    CategoryData(icon: Icons.wc, label: 'Underwear'),
  ];

  final List<CategoryData> womanCategories = [
    CategoryData(icon: Icons.checkroom, label: 'Dress'),
    CategoryData(icon: Icons.emoji_people, label: 'Woman T-Shirt'),
    CategoryData(icon: Icons.fireplace, label: 'Woman Pants'),
    CategoryData(icon: Icons.shopping_bag, label: 'Skirt'),
    CategoryData(icon: Icons.work_outline, label: 'Woman Bag'),
    CategoryData(icon: Icons.high_quality, label: 'High Heels'),
    CategoryData(icon: Icons.pool, label: 'Bikini'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Man Fashion', style: AppTextStyles.h2),
          const SizedBox(height: 16),
          CategoryGrid(categories: manCategories),

          const SizedBox(height: 24),
          Text('Woman Fashion', style: AppTextStyles.h2),
          const SizedBox(height: 16),
          CategoryGrid(categories: womanCategories),
        ],
      ),
    );
  }
}
