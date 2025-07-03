import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double screenHeight = MediaQuery.of(context).size.height;
        bool isMobile = screenWidth < 600;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: screenHeight * 0.7,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 40),
          child: isMobile
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildHeroContent(context, screenWidth, isMobile),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: _buildHeroContent(context, screenWidth, isMobile),
                ),
        );
      },
    );
  }

  List<Widget> _buildHeroContent(BuildContext context, double screenWidth, bool isMobile) {
    return [
      Container(
        width: isMobile ? screenWidth * 0.9 : screenWidth * 0.5,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.greenAccent.withOpacity(0.3), width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Hi, I'm Roshan",
                  textStyle: GoogleFonts.spaceMono(
                    fontSize: isMobile ? 40 : 75,
                    fontWeight: FontWeight.bold,
                    color: Colors.greenAccent,
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
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "A passionate tech innovator and problem solver, with expertise in Flutter, web development, and AI-driven applications. Crafting user-friendly mobile apps and ML-powered solutions with a focus on efficiency and impact.",
                  textStyle: GoogleFonts.spaceMono(
                    fontSize: isMobile ? 16 : 24,
                    color: Colors.grey[300],
                    height: 1.5,
                  ),
                  speed: const Duration(milliseconds: 10),
                ),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 200),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.easeIn,
              ),
              child: ElevatedButton(
                onPressed: () => Get.toNamed('/cv'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.withOpacity(0.2),
                  foregroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: BorderSide(color: Colors.greenAccent.withOpacity(0.5)),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: Text(
                  'Download CV',
                  style: GoogleFonts.spaceMono(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      if (!isMobile) const SizedBox(width: 50),
      CircleAvatar(
        radius: isMobile ? screenWidth * 0.3 : screenWidth * 0.15,
        backgroundImage: const AssetImage("assets/images/profile.jpg"),
        backgroundColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.greenAccent.withOpacity(0.5), width: 2),
          ),
        ),
      ),
    ];
  }
}