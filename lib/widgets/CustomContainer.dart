import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth < 600 ? 50 : 90;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: MediaQuery.of(context).size.height * 0.6,
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dart',
                style: GoogleFonts.spaceMono(
                  color: Colors.cyanAccent.withOpacity(0.5),
                  fontSize: fontSize,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.cyanAccent.withOpacity(0.3),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Flutter',
                style: GoogleFonts.spaceMono(
                  color: Colors.cyanAccent.withOpacity(0.75),
                  fontSize: fontSize,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.cyanAccent.withOpacity(0.3),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Code',
                style: GoogleFonts.spaceMono(
                  color: Colors.cyanAccent,
                  fontSize: fontSize,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.cyanAccent.withOpacity(0.3),
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}