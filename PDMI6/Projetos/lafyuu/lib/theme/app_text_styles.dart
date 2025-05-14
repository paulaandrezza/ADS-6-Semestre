import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _baseStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return GoogleFonts.quicksand(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle title1 = _baseStyle(
    24,
    FontWeight.bold,
    AppColors.textPrimary,
  );
  static TextStyle title2 = _baseStyle(
    20,
    FontWeight.w700,
    AppColors.textPrimary,
  );
  static TextStyle subtitle = _baseStyle(
    16,
    FontWeight.w700,
    AppColors.textSecondary,
  );
  static TextStyle subtitle2 = _baseStyle(
    14,
    FontWeight.w700,
    AppColors.textSecondary,
  );
  static TextStyle button = _baseStyle(16, FontWeight.w700, Colors.white);
  static TextStyle link = _baseStyle(16, FontWeight.w700, AppColors.primary);
  static TextStyle body = _baseStyle(
    14,
    FontWeight.w600,
    AppColors.textSecondary,
  );
  static TextStyle body2 = _baseStyle(
    14,
    FontWeight.w700,
    AppColors.textPrimary,
  );
  static TextStyle body3 = _baseStyle(14, FontWeight.normal, AppColors.primary);
}
