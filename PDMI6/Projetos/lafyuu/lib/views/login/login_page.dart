import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/models/enums/UserRole.dart';
import 'package:lafyuu/routes/app_routes.dart';
import 'package:lafyuu/services/login_service.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';
import 'package:lafyuu/widgets/primary_button.dart';
import 'package:lafyuu/widgets/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleLogin() async {
    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    final loginService = LoginService();

    try {
      final user = await loginService.login(email, password);

      if (user.role == UserRole.seller) {
        Navigator.pushReplacementNamed(context, AppRoutes.sellerMain.path);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.main.path);
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString().replaceFirst('Exception: ', '')),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              SvgPicture.asset('assets/images/logo.svg', height: 80),
              const SizedBox(height: 24),

              Text('Welcome to Lafyuu', style: AppTextStyles.h2),
              const SizedBox(height: 8),

              Text('Sign in to continue', style: AppTextStyles.subtitle),
              const SizedBox(height: 32),

              TextField(
                controller: _emailController,
                style: TextStyle(color: AppColors.grey),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.grey,
                  ),
                  hintText: 'Your Email',
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.grey,
                  ),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: PrimaryButton(
                  label: 'Sign In',
                  onPressed: _handleLogin,
                  isLoading: _isLoading,
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      endIndent: 16,
                    ),
                  ),
                  const Text(
                    'OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                      indent: 16,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              SocialLoginButton(
                assetPath: 'assets/images/google_icon.png',
                label: 'Login with Google',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              SocialLoginButton(
                assetPath: 'assets/images/facebook_icon.png',
                label: 'Login with facebook',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style: AppTextStyles.bodyLightBlue,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: AppTextStyles.subtitle3,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Register', style: AppTextStyles.bodyLightBlue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
