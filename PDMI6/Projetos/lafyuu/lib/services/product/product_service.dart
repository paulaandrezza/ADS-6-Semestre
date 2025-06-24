import 'dart:convert';
import 'package:lafyuu/models/product.dart';
import 'package:lafyuu/services/api/api_client.dart';

class ProductService {
  final ApiClient _apiClient = ApiClient();

  Future<List<Product>> get() async {
    try {
      final response = await _apiClient.get('/products');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList
            .map((json) => Product.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception('Failed to load products: ${errorResponse['error']}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Product> getById(String id) async {
    try {
      final response = await _apiClient.get('/products/$id');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return Product.fromJson(jsonMap);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception('Failed to load product: ${errorResponse['error']}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
