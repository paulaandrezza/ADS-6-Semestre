import 'dart:convert';

import 'package:lafyuu/models/enums/UserRole.dart';
import 'package:lafyuu/models/user/user.dart';

class AuthService {
  // static const _mockToken =
  //     'header.eyJpZCI6InVzZXJTZWxsZXIxMjMiLCJyb2xlIjoyfQ.signature';
  static const _mockToken =
      'header.eyJpZCI6InVzZXJTZWxsZXIxMjMiLCJyb2xlIjoxfQ.signature';

  Future<String?> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    if (email == 'paula@example.com' && password == '123456') {
      return _mockToken;
    }

    return null;
  }

  User? parseToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;

      final payloadBase64 = parts[1];
      final normalized = base64.normalize(payloadBase64);
      final decoded = utf8.decode(base64.decode(normalized));

      final Map<String, dynamic> payload = json.decode(decoded);

      final String id = payload['id'];
      final int roleNumber = payload['role'];

      final role = UserRole.values.firstWhere(
        (r) => r.index == roleNumber,
        orElse: () => UserRole.client,
      );

      return User(id: id, role: role);
    } catch (e) {
      print('Error parsing token: $e');
      return null;
    }
  }
}
