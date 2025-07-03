import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/colors.dart';

class InfoContainer extends StatefulWidget {
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
  _InfoContainerState createState() => _InfoContainerState();
}

class _InfoContainerState extends State<InfoContainer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    assert(widget.imageLocations.length == widget.technologies.length,
        'The number of image locations must match the number of technologies');

    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: () {
          _controller.forward().then((_) => _controller.reverse());
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: MediaQuery.of(context).size.width < 600 ? 250 : 350,
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
                  // Glassmorphism effect
                  color: Colors.white.withOpacity(0.1),
                  backgroundBlendMode: BlendMode.overlay,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: GoogleFonts.spaceMono(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width < 600 ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 10.0,
                            color: AppColors.neonGlow.withOpacity(0.3),
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(
                      widget.imageLocations.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width < 600 ? 40 : 50,
                              height: MediaQuery.of(context).size.width < 600 ? 40 : 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.neonGlow.withOpacity(0.5), width: 1.5),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.neonGlow.withOpacity(0.2),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Image.network(
                                widget.imageLocations[index],
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
                                  return const Center(child: CircularProgressIndicator(color: AppColors.neonGlow));
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.technologies[index],
                                style: GoogleFonts.spaceMono(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.width < 600 ? 14 : 16,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}