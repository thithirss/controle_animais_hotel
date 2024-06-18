import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Animais',
      theme: _buildTheme(),
      home: const HomeScreen(),
    );
  }

  ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      primaryColor: const Color.fromARGB(255, 48, 39, 176),
      colorScheme: base.colorScheme.copyWith(
        secondary: Colors.orange,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: _buildTextTheme(base.textTheme),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 48, 39, 176), // Background color
          foregroundColor: Color.fromARGB(255, 255, 255, 255), // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 48, 39, 176),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        color: const Color.fromARGB(255, 48, 39, 176),
      ),
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: 16.0,
        color: Colors.black87,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: 14.0,
        color: Colors.black54,
      ),
    );
  }
}
