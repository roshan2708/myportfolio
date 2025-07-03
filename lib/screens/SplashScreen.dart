import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to LandingPage after 3 seconds with error handling
    Future.delayed(const Duration(seconds: 3), () {
      try {
        Get.offNamed('/home');
      } catch (e) {
        Get.snackbar('Navigation Error', 'Failed to load Landing Page: $e');
      }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = constraints.maxWidth < 600 ? 24 : 32;
            return AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'Initializing Portfolio...',
                  textStyle: GoogleFonts.spaceMono(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent.withOpacity(0.8),
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.greenAccent.withOpacity(0.3),
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 500),
            );
          },
        ),
      ),
    );
  }
}