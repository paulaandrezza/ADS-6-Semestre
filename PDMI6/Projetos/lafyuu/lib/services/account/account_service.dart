import 'dart:convert';
import 'package:lafyuu/models/user/user_details.dart';
import 'package:lafyuu/services/api/api_client.dart';

class AccountService {
  final ApiClient _apiClient = ApiClient();

  Future<UserDetails> get() async {
    try {
      final response = await _apiClient.get('/users/account');

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return UserDetails.fromJson(jsonMap);
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(response.body);
        throw Exception(
          'Failed to load user details: ${errorResponse['error']}',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
