import 'package:flutter/material.dart';
import 'package:lafyuu/models/product/product_card.dart';
import 'package:lafyuu/services/product/product_service.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/widgets/product_card/product_card_compact_list.dart';

class ProductManagerScreen extends StatefulWidget {
  const ProductManagerScreen({super.key});

  @override
  State<ProductManagerScreen> createState() => _ProductManagerScreenState();
}

class _ProductManagerScreenState extends State<ProductManagerScreen> {
  final ProductService _productService = ProductService();
  final TextEditingController _searchController = TextEditingController();
  List<ProductCard> products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final response = await _productService.get();
      setState(() {
        products = response;
      });
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro ao carregar produtos: $e')));
    } finally {
      setState(() => isLoading = false);
    }
  }

  void _removeProduct(String id) {
    setState(() {
      products.removeWhere((product) => product.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            icon: Icon(Icons.add, color: AppColors.grey),
            onPressed: () {
              // TODO: implementar ação de adicionar produto
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16.0),
                child: ProductCardCompactList(
                  products: products,
                  onDelete: _removeProduct,
                ),
              ),
    );
  }
}
