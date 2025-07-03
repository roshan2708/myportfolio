import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSkillCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final Color cardColor;

  const CustomSkillCard({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        // Use fixed width for horizontal scroll compatibility
        width: MediaQuery.of(context).size.width < 600 ? 150 : 200,
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          color: cardColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.greenAccent.withOpacity(0.3), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.greenAccent.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                height: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                    height: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red, size: 48);
                },
              ),
              const SizedBox(height: 8),
              Text(
                text,
                style: GoogleFonts.spaceMono(
                  fontSize: MediaQuery.of(context).size.width < 600 ? 18 : 24,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}