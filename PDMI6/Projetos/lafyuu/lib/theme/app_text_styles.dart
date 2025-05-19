import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle _baseStyle(
    double fontSize,
    FontWeight fontWeight,
    Color color,
  ) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle h1 = _baseStyle(24, FontWeight.bold, AppColors.dark);
  static TextStyle h2 = _baseStyle(20, FontWeight.w700, AppColors.dark);
  static TextStyle subtitle = _baseStyle(16, FontWeight.normal, AppColors.grey);
  static TextStyle subtitle2 = _baseStyle(16, FontWeight.w700, AppColors.grey);
  static TextStyle button = _baseStyle(16, FontWeight.w700, Colors.white);

  static TextStyle body = _baseStyle(14, FontWeight.w600, AppColors.grey);
  static TextStyle body2 = _baseStyle(14, FontWeight.w700, AppColors.dark);
  static TextStyle body3 = _baseStyle(14, FontWeight.normal, AppColors.primary);
  static TextStyle bodyLightBlue = _baseStyle(
    16,
    FontWeight.w700,
    AppColors.primary,
  );
  static TextStyle bodyLightBlue2 = _baseStyle(
    20,
    FontWeight.w700,
    AppColors.primary,
  );
}
