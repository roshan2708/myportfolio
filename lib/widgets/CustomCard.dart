import 'package:flutter/material.dart';

class CustomSkillCard extends StatelessWidget {
  final String imageUrl; // URL to the image
  final String text; // Text to display
  final Color cardColor; // Background color of the card

  const CustomSkillCard({
    super.key,
    required this.imageUrl,
    required this.text,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      child: Container(
        width: screenWidth * 0.2, // 20% of screen width
        height: screenHeight * 0.2, // 20% of screen height
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                imageUrl,
                width: 64,
                height: 64,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const SizedBox(
                    width: 64,
                    height: 64,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.error, color: Colors.red, size: 64);
                },
              ),
              const SizedBox(height: 8), // Spacing between image and text
              Text(
                text,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white, // White text for contrast
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
