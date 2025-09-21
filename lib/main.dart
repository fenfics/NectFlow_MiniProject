import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn = false;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: AppColors.accent,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: AppColors.darkGreen),
        ),
      ),
      home: isLoggedIn ? LoginPage() : LoginPage(),
    );
  }
}
