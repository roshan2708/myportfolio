import 'package:flutter/material.dart';

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
    // Ensure the lists have the same length
    assert(imageLocations.length == technologies.length,
        'The number of image locations must match the number of technologies');

    return Container(
      width: MediaQuery.of(context).size.width * 0.3, // 30% of screen width
      decoration: BoxDecoration(
        color: Colors.transparent, // Transparent background
        border: Border.all(
          color: Colors.white, // White border
          width: 0.4,
        ),
      ),
      padding: const EdgeInsets.all(16.0), // Internal padding
      child: Column(
        mainAxisSize: MainAxisSize.min, // Makes column take minimum height needed
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16), // Space between title and content
          // Dynamically generate rows for each image-technology pair
          ...List.generate(
            imageLocations.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0), // Corrected to bottom
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1), // Debug border
                      image: DecorationImage(
                        image: NetworkImage(imageLocations[index]),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {
                          print('Error loading image ${imageLocations[index]}: $exception');
                        },
                      ),
                    ),
                    child: Image.network(
                      imageLocations[index],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 30,
                        ); // Fallback for failed image load
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        ); // Loading indicator
                      },
                    ),
                  ),
                  const SizedBox(width: 12), // Space between image and text
                  Expanded(
                    child: Text(
                      technologies[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
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