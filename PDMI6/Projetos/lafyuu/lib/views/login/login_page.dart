import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lafyuu/theme/app_text_styles.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              // Logo
              SvgPicture.asset('assets/images/logo.svg', height: 80),
              const SizedBox(height: 24),

              // Title
              Text('Welcome to Lafyuu', style: AppTextStyles.title2),
              const SizedBox(height: 8),

              // Subtitle
              Text('Sign in to continue', style: AppTextStyles.subtitle),
              const SizedBox(height: 32),

              // Email field
              TextField(
                // TODO: texto durante a digitação diferente
                style: TextStyle(color: AppColors.textSecondary),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.textSecondary,
                  ),
                  hintText: 'Your Email',
                ),
              ),
              const SizedBox(height: 16),

              // Password field
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_outline,
                    color: AppColors.textSecondary,
                  ),
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 24),

              // Sign In button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: PrimaryButton(
                  label: 'Sign In',
                  onPressed: () {
                    // TODO: criar login
                    Navigator.pushReplacementNamed(context, AppRoutes.main);
                  },
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

              // Google login
              SocialLoginButton(
                assetPath: 'assets/images/google_icon.png',
                label: 'Login with Google',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // Facebook login
              SocialLoginButton(
                assetPath: 'assets/images/facebook_icon.png',
                label: 'Login with facebook',
                onTap: () {},
              ),
              const SizedBox(height: 24),

              // Forgot password
              TextButton(
                onPressed: () {},
                child: Text('Forgot Password?', style: AppTextStyles.link),
              ),

              // Register
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: Text('Register', style: AppTextStyles.link),
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
