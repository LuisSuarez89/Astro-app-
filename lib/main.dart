import 'package:flutter/material.dart';

import 'screens/horoscope_form_screen.dart';

void main() {
  runApp(const AstroApp());
}

class AstroApp extends StatelessWidget {
  const AstroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astro App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF090114),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9C6BFF),
          brightness: Brightness.dark,
          primary: const Color(0xFF9C6BFF),
          secondary: const Color(0xFF4DE2C5),
          surface: const Color(0xFF150826),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
          bodyLarge: TextStyle(height: 1.5),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withValues(alpha: 0.06),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: Colors.white.withValues(alpha: 0.08),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Color(0xFF4DE2C5)),
          ),
        ),
      ),
      home: const HoroscopeFormScreen(),
    );
  }
}
