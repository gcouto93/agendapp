import 'package:agenda_ja_app/app/core/ui/app_colors.dart';
import 'package:flutter/material.dart';

class UiConfig {
  UiConfig._();

  static String get title => 'AgendApp';

  static ThemeData get theme => ThemeData(
        primaryColor: AppColors.primary,
        primaryColorDark: AppColors.primaryDark,
        primaryColorLight: AppColors.primaryLight,
        primarySwatch: AppColors.primarySwatch,
        scaffoldBackgroundColor: AppColors.sand,
        hintColor: AppColors.secondary,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
          backgroundColor: AppColors.secondary,
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.secondary,
          surface: AppColors.background,
          error: AppColors.error,
          inversePrimary: AppColors.inversePrimary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.textPrimary),
          bodyMedium: TextStyle(color: AppColors.textSecondary),
        ),
      );
}
