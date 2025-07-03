import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainer extends StatelessWidget {
  final List<String> imageLocations;
  final List<String> technologies;
  final String title;

  const InfoContainer({
    required this.imageLocations,
    required this.technologies,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    assert(imageLocations.length == technologies.length,
        'The number of image locations must match the number of technologies');

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      // Use fixed width for horizontal scroll compatibility
      width: MediaQuery.of(context).size.width < 600 ? 250 : 350,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.3), width: 0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceMono(
              color: Colors.greenAccent,
              fontSize: MediaQuery.of(context).size.width < 600 ? 18 : 20,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.greenAccent.withOpacity(0.3),
                  offset: const Offset(0, 0),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ...List.generate(
            imageLocations.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width < 600 ? 40 : 50,
                    height: MediaQuery.of(context).size.width < 600 ? 40 : 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent.withOpacity(0.3), width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      imageLocations[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 30,
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      technologies[index],
                      style: GoogleFonts.spaceMono(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width < 600 ? 14 : 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}