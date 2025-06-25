import 'package:flutter/material.dart';
import 'package:lafyuu/theme/app_colors.dart';
import 'package:lafyuu/theme/app_text_styles.dart';

class CartSuccessScreen extends StatelessWidget {
  const CartSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícone de sucesso
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.check, color: Colors.white, size: 48),
                ),

                const SizedBox(height: 32),

                // Texto principal
                Text(
                  'Success',
                  style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                // Texto secundário
                Text(
                  'thank you for shopping using lafyuu',
                  style: AppTextStyles.body.copyWith(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 48),

                // Botão
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      ); // ou Navigator.pushNamed(context, '/cart');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Back To Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
