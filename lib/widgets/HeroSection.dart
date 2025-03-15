import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Herosection extends StatefulWidget {
  const Herosection({super.key});

  @override
  State<Herosection> createState() => _HerosectionState();
}

class _HerosectionState extends State<Herosection> {
  bool _isDescriptionComplete = false; // Flag to track when animation is complete

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.7,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10), // Reduced internal padding
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread content towards edges
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Side: About Me (Increased Width)
          Container(
            width: screenWidth * 0.45, // Increased width to stretch towards the left edge
            height: screenHeight * 0.5,
            padding: const EdgeInsets.all(15), // Slightly reduced padding
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Animated Heading: "Hi, I'm Roshan"
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Hi, I'm Roshan",
                      textStyle: const TextStyle(
                        fontSize: 75,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      speed: const Duration(milliseconds: 100),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 500),
                  onFinished: () {
                    // Optional: Add logic after the heading animation completes
                  },
                ),
                const SizedBox(height: 10),
                // Animated Description
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "A passionate tech innovator and problem solver, with a strong foundation in Flutter, web development, and AI-powered applications. From building user-friendly mobile apps to developing ML-driven solutions, the focus is always on creating impactful and efficient technology. Experienced in state management, API integration, and UI/UX design, with a growing interest in Go (Golang) and advanced AI models.",
                      textStyle: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[300],
                        height: 1.5,
                      ),
                      speed: const Duration(milliseconds: 5),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 200),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  onFinished: () {
                    setState(() {
                      _isDescriptionComplete = true;
                    });
                  },
                ),
                const SizedBox(height: 20),
                // Download CV Button
                if (_isDescriptionComplete)
                  ElevatedButton(
                    onPressed: () {
                      const url = 'https://drive.google.com/your-cv-link';
                      print('Opening CV link: $url');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                    ),
                    child: const Text(
                      'Download CV',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
    
          // Reduced spacing between text & avatar
          SizedBox(width: MediaQuery.of(context).size.width * 0.1), // Reduced spacing
    
          // Right Side: Profile Picture in CircleAvatar (Moved closer to right edge)
          CircleAvatar(
            radius: screenWidth * 0.15, // Slightly increased size for balance
            backgroundImage: const AssetImage("assets/images/profile.jpg"),
          ),
        ],
      ),
    );
  }
}