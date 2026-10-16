
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const PacureApp());
}

class PacureApp extends StatelessWidget {
  const PacureApp({super.key});

  static const Color primaryPurple = Color(0xFF6A1B9A);
  static const Color backgroundPurple = Color(0xFF6A1B9A);
  static const Color darkText = Color(0xFF171717);
  static const Color lightBackground = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pacure',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        // Main app colors
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPurple,
          primary: primaryPurple,
          secondary: backgroundPurple,
          surface: Colors.white,
          onSurface: darkText,
        ),

        scaffoldBackgroundColor: lightBackground,

        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryPurple,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 54),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: Color(0xFFE5DDF2),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: primaryPurple,
              width: 1.5,
            ),
          ),
        ),

        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: darkText,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: darkText,
          ),
        ),
      ),

      // First screen shown when the app opens
      home: const LoginPage(),
    );
  }
}
