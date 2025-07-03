import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/constants/colors.dart';

class CustomSkillCard extends StatefulWidget {
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
  _CustomSkillCardState createState() => _CustomSkillCardState();
}

class _CustomSkillCardState extends State<CustomSkillCard> with SingleTickerProviderStateMixin {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: MediaQuery.of(context).size.width < 600 ? 150 : 200,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [widget.cardColor, widget.cardColor.withOpacity(0.6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.neonGlow.withOpacity(0.5), width: 1.5),
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
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          widget.imageUrl,
                          width: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                          height: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return SizedBox(
                              width: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                              height: MediaQuery.of(context).size.width < 600 ? 48 : 64,
                              child: const Center(child: CircularProgressIndicator(color: AppColors.neonGlow)),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error, color: Colors.red, size: 48);
                          },
                        ),
                        const SizedBox(height: 12),
                        Text(
                          widget.text,
                          style: GoogleFonts.spaceMono(
                            fontSize: MediaQuery.of(context).size.width < 600 ? 18 : 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}