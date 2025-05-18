class AuthService {
  static const _validEmail = 'paula@example.com';
  static const _validPassword = '123456';

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    return email == _validEmail && password == _validPassword;
  }
}
