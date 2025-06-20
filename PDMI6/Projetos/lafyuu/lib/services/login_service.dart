import 'package:lafyuu/models/user/user.dart';
import 'package:lafyuu/services/auth/auth_service.dart';
import 'package:lafyuu/services/storage/token_storage_service.dart';

class LoginService {
  final AuthService _authService = AuthService();
  final TokenStorageService _tokenStorageService = TokenStorageService();

  Future<User> login(String email, String password) async {
    final token = await _authService.login(email, password);

    if (token == null) {
      throw Exception('Invalid email or password.');
    }

    final user = _authService.parseToken(token);

    if (user == null) {
      throw Exception('Invalid token received.');
    }

    await _tokenStorageService.saveToken(token);

    return user;
  }
}
