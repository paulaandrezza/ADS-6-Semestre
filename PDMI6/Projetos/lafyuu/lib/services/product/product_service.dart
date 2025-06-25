import 'dart:convert';
import 'package:lafyuu/models/product/product.dart';
import 'package:lafyuu/models/product/product_card.dart';
import 'package:lafyuu/models/product/product_detail.dart';
import 'package:lafyuu/services/api/api_client.dart';

class ProductService {
  final ApiClient _apiClient = ApiClient();

  Future<List<ProductCard>> get() async {
    try {
      final response = await _apiClient.get('/products/?pageSize=1000');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> jsonList = jsonMap['products'];

        return jsonList
            .map((json) => ProductCard.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception('Failed to load products: ${errorResponse['error']}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductDetail> getById(String id) async {
    try {
      final response = await _apiClient.get('/products/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return ProductDetail.fromJson(jsonMap);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception('Failed to load product: ${errorResponse['error']}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
