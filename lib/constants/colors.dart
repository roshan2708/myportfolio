import 'package:flutter/material.dart';

class AppColors {
  static const Color neonGlow = Color(0xFF39FF14); // Bright neon green for glow effects
  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [Color(0xFF0D1B2A), Color(0xFF1B263B)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient navGradient = LinearGradient(
    colors: [Color(0xFF0D1B2A), Color(0xFF1B263B).withOpacity(0.8)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
  static const Color color1 = Color(0xFF1E88E5); // Blue for Flutter
  static const Color color2 = Color(0xFF00C4B4); // Teal for Dart
  static const Color color3 = Color(0xFF0288D1); // Light blue for GoLang
  static const Color color4 = Color(0xFFFFCA28); // Yellow for Firebase
  static const Color color5 = Color(0xFF43A047); // Green for Python
}