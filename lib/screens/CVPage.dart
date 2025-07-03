import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CvPage extends StatelessWidget {
  const CvPage({super.key});

  // Function to launch URLs
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SingleChildScrollView(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double padding = constraints.maxWidth < 600 ? 16 : 55;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: padding, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Section
                    _buildHeader(context, constraints),
                    const SizedBox(height: 40),
                    // Education Section
                    _buildSectionTitle(context, constraints, 'Education'),
                    const SizedBox(height: 20),
                    _buildEducationCard(context, constraints),
                    const SizedBox(height: 40),
                    // Experience Section
                    _buildSectionTitle(context, constraints, 'Experience'),
                    const SizedBox(height: 20),
                    _buildExperienceCard(context, constraints),
                    const SizedBox(height: 40),
                    // Projects Section
                    _buildSectionTitle(context, constraints, 'Projects'),
                    const SizedBox(height: 20),
                    _buildProjectsSection(context, constraints),
                    const SizedBox(height: 40),
                    // Technologies Section
                    _buildSectionTitle(context, constraints, 'Technologies'),
                    const SizedBox(height: 20),
                    _buildTechnologiesSection(context, constraints),
                    const SizedBox(height: 40),
                    // Achievements Section
                    _buildSectionTitle(context, constraints, 'Achievements'),
                    const SizedBox(height: 20),
                    _buildAchievementsSection(context, constraints),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Roshan Singh',
          style: GoogleFonts.spaceMono(
            color: Colors.white,
            fontSize: constraints.maxWidth < 600 ? 36 : 48,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            shadows: [
              Shadow(
                blurRadius: 15.0,
                color: AppColors.neonGlow,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Kolkata | rs602543@gmail.com | +91 6290900604',
          style: GoogleFonts.spaceMono(
            color: Colors.white70,
            fontSize: constraints.maxWidth < 600 ? 14 : 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            GestureDetector(
              onTap: () => _launchUrl('https://roshan-singh-portfolio.netlify.app'),
              child: Text(
                'roshan-singh-portfolio.netlify.app',
                style: GoogleFonts.spaceMono(
                  color: AppColors.neonGlow,
                  fontSize: constraints.maxWidth < 600 ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _launchUrl('https://linkedin.com/in/roshan-singh-680b84a21'),
              child: Text(
                'LinkedIn',
                style: GoogleFonts.spaceMono(
                  color: AppColors.neonGlow,
                  fontSize: constraints.maxWidth < 600 ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () => _launchUrl('https://github.com/roshan2078'),
              child: Text(
                'GitHub',
                style: GoogleFonts.spaceMono(
                  color: AppColors.neonGlow,
                  fontSize: constraints.maxWidth < 600 ? 14 : 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context, BoxConstraints constraints, String title) {
    return Text(
      title,
      style: GoogleFonts.spaceMono(
        color: Colors.white,
        fontSize: constraints.maxWidth < 600 ? 28 : 36,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
        shadows: [
          Shadow(
            blurRadius: 15.0,
            color: AppColors.neonGlow,
            offset: const Offset(0, 0),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, BoxConstraints constraints) {
    return _buildGlassCard(
      context,
      constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Haldia Institute of Technology, B.Tech in ECE',
            style: GoogleFonts.spaceMono(
              color: Colors.white,
              fontSize: constraints.maxWidth < 600 ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Sept 2023 - July 2027',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'GPA: 8.15',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Coursework: Electronic Devices, Circuits, Communication Systems, Signal Processing',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, BoxConstraints constraints) {
    return _buildGlassCard(
      context,
      constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flutter Developer, ConciseX',
            style: GoogleFonts.spaceMono(
              color: Colors.white,
              fontSize: constraints.maxWidth < 600 ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'May 2025 - Current',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '• Working hand-in-hand with the development team to build and optimize cross-platform mobile apps in Flutter and Dart, with particular attention to UI/UX and performance.',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '• Developing new features, fixing bugs, and integrating APIs all within agile development practices and Git version control system.',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectsSection(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        _buildProjectCard(
          context,
          constraints,
          title: 'Google Developers Group App',
          description: [
            'Developed a collaborative platform for GDG HIT Haldia where the members can share resources, post updates, list events and engage in real-time discussions to foster community innovation.',
            'Designed with a simple, responsive user interface (UI) that uses Flutter to guarantee a seamless experience, including support for dark and light modes.',
            'Tools Used: Flutter, Dart, GetX, Firebase',
          ],
        ),
        const SizedBox(height: 20),
        _buildProjectCard(
          context,
          constraints,
          title: 'Personalize',
          description: [
            'Developed a personality analysis app driven by AI that assesses traits and produces insights using real-time audio-visual input and quizzes.',
            'Created a visually appealing dashboard that provides a thorough user analysis at a glance by showcasing personality scores using bar and radar charts.',
            'Tools Used: Flutter, Dart, Provider, Gemini API, Firebase',
          ],
        ),
        const SizedBox(height: 20),
        _buildProjectCard(
          context,
          constraints,
          title: 'Hectoclash',
          description: [
            'Developed a real-time math duel game with competitive leaderboards, timed puzzles, and performance analytics.',
            'GetX-powered state management is implemented for seamless user interface with timer-based animations.',
            'Tools Used: Flutter, Dart, GetX, Firebase',
          ],
        ),
      ],
    );
  }

  Widget _buildProjectCard(
    BuildContext context,
    BoxConstraints constraints, {
    required String title,
    required List<String> description,
  }) {
    return _buildGlassCard(
      context,
      constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceMono(
              color: Colors.white,
              fontSize: constraints.maxWidth < 600 ? 18 : 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          ...description.map(
            (desc) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '• $desc',
                style: GoogleFonts.spaceMono(
                  color: Colors.white70,
                  fontSize: constraints.maxWidth < 600 ? 14 : 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTechnologiesSection(BuildContext context, BoxConstraints constraints) {
    return _buildGlassCard(
      context,
      constraints,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Languages: Dart, Go, Python, C, C++, JavaScript',
            style: GoogleFonts.spaceMono(
              color: Colors.white,
              fontSize: constraints.maxWidth < 600 ? 16 : 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Technologies: Flutter, GetX, Provider, BLOC, Firebase, Microsoft SQL Server, VS Code, Android Studio, XCode, Figma, Canva',
            style: GoogleFonts.spaceMono(
              color: Colors.white70,
              fontSize: constraints.maxWidth < 600 ? 14 : 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context, BoxConstraints constraints) {
    return Column(
      children: [
        _buildAchievementCard(
          context,
          constraints,
          'Won First Prize in Trinity Tech Challenge for the HectoClash app.',
        ),
        const SizedBox(height: 20),
        _buildAchievementCard(
          context,
          constraints,
          'Won Third Prize in Kitrtrim 25 for the Personalize app.',
        ),
        const SizedBox(height: 20),
        _buildAchievementCard(
          context,
          constraints,
          'Qualified for the prestigious Smart India Hackathon at the college level.',
        ),
        const SizedBox(height: 20),
        _buildAchievementCard(
          context,
          constraints,
          'Participated in several national-level hackathons as a team leader, showcasing strong project development and leadership skills.',
        ),
      ],
    );
  }

  Widget _buildAchievementCard(BuildContext context, BoxConstraints constraints, String text) {
    return _buildGlassCard(
      context,
      constraints,
      child: Text(
        '• $text',
        style: GoogleFonts.spaceMono(
          color: Colors.white70,
          fontSize: constraints.maxWidth < 600 ? 14 : 16,
        ),
      ),
    );
  }

  Widget _buildGlassCard(BuildContext context, BoxConstraints constraints, {required Widget child}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: constraints.maxWidth < 600 ? double.infinity : 800,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black.withOpacity(0.7), Colors.black.withOpacity(0.4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: AppColors.neonGlow.withOpacity(0.5), width: 1.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.neonGlow.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
        color: Colors.white.withOpacity(0.1),
        backgroundBlendMode: BlendMode.overlay,
      ),
      child: child,
    );
  }
}