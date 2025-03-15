import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:myportfolio/screens/LandingPage.dart';
import 'package:myportfolio/widgets/HeroSection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a delay (e.g., for loading resources) and navigate to the next screen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()), // Replace with your main screen
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Loading',
              textStyle: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white, // White text color
              ),
              speed: const Duration(milliseconds: 100), // Typing speed
            ),
          ],
          totalRepeatCount: 1, // Play animation once
          pause: const Duration(milliseconds: 500), // Pause after typing
          onFinished: () {
            // Optional: Add logic after animation completes (e.g., navigation)
          },
        ),
      ),
    );
  }
}