import 'package:flutter/material.dart';

class AppColors {
  static const green900 = Color(0xFF10432B);
  static const green700 = Color(0xFF1E8A56);
  static const green600 = Color(0xFF239C61);
  static const green500 = Color(0xFF2FB374);
  static const green100 = Color(0xFFE4F5EC);
  static const green50 = Color(0xFFF2FAF6);
  static const amber500 = Color(0xFFE8A33D);
  static const ink900 = Color(0xFF16221C);
  static const ink700 = Color(0xFF3E4A44);
  static const ink500 = Color(0xFF6C766F);
  static const ink300 = Color(0xFFA8B0AB);
  static const line = Color(0xFFE4E9E5);
  static const bg = Color(0xFFF7FAF8);
}

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bg,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.green700,
        primary: AppColors.green700,
        secondary: AppColors.amber500,
      ),
      fontFamily: 'Segoe UI',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.bg,
        foregroundColor: AppColors.ink900,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColors.ink900, fontSize: 16, fontWeight: FontWeight.w800),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.ink900),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.line),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.green600, width: 1.5),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green700,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14.5),
          elevation: 0,
        ),
      ),
    );
  }
}
