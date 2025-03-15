import 'dart:ui'; // For BackdropFilter
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final String assetImage; // Changed from imageUrl
  final String githubUrl;

  const ProjectCard({
    required this.title,
    required this.description,
    required this.assetImage, // Updated variable name
    required this.githubUrl,
    Key? key,
  }) : super(key: key);

  void _launchURL() async {
    if (!await launchUrl(Uri.parse(githubUrl), mode: LaunchMode.externalApplication)) {
      debugPrint('Could not launch $githubUrl');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Blur effect
            child: Container(
              width: 280, // Fixed width for uniform cards
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3), // Subtle border
                  width: 0.4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(assetImage, height: 120, width: double.infinity, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for contrast
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Usage in Row for Landing Page
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ProjectCard(
            title: "Personalyze",
            description: "An AI-based app that analyzes human behavior using camera & microphone input and provides a personality score with detailed visualizations.",
            assetImage: "assets/images/personalyze.jpg", // Change here
            githubUrl: "https://github.com/yourusername/personalyze",
          ),
          ProjectCard(
            title: "COVID-19 Tracker",
            description: "A real-time COVID-19 tracker that provides live updates, statistics, and safety guidelines using global API data.",
            assetImage: "assets/images/covidtracker.jpg", // Change here
            githubUrl: "https://github.com/yourusername/covid-tracker",
          ),
          ProjectCard(
            title: "DefiniteIt",
            description: "A dictionary and vocabulary-enhancing app that provides precise definitions, synonyms, and word usage insights.",
            assetImage: "assets/images/definiteit.jpg", // Change here
            githubUrl: "https://github.com/yourusername/definiteit",
          ),
        ],
      ),
    );
  }
}
