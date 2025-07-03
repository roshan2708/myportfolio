import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  Future<void> _sendEmail(String message) async {
    if (message.isEmpty) {
      Get.snackbar('Error', 'Please enter a message');
      return;
    }

    final String subject = Uri.encodeComponent('Message from Portfolio');
    final String body = Uri.encodeComponent(message);
    final String emailUrl = 'mailto:rs602543@gmail.com?subject=$subject&body=$body';

    try {
      if (await canLaunchUrl(Uri.parse(emailUrl))) {
        await launchUrl(Uri.parse(emailUrl));
        Get.snackbar('Success', 'Opening email client...');
      } else {
        throw 'Could not launch email client';
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not launch email client: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return LayoutBuilder(
      builder: (context, constraints) {
        double padding = constraints.maxWidth < 600 ? 16 : 55;
        return Container(
          padding: EdgeInsets.all(padding),
          color: Colors.black.withOpacity(0.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Get in Touch',
                style: GoogleFonts.spaceMono(
                  fontSize: constraints.maxWidth < 600 ? 18 : 20,
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
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                style: GoogleFonts.spaceMono(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  hintStyle: GoogleFonts.spaceMono(color: Colors.white.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.greenAccent.withOpacity(0.3)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.greenAccent.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.greenAccent),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send, color: Colors.greenAccent),
                    onPressed: () => _sendEmail(emailController.text),
                  ),
                ),
                maxLines: constraints.maxWidth < 600 ? 2 : 1,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.whatsapp,
                    url: 'https://wa.me/yourphonenumber',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.linkedin,
                    url: 'https://linkedin.com/in/yourusername',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.xTwitter,
                    url: 'https://x.com/yourusername',
                  ),
                  const SizedBox(width: 20),
                  _buildSocialIcon(
                    icon: FontAwesomeIcons.instagram,
                    url: 'https://instagram.com/yourusername',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  '© ${DateTime.now().year} Roshan Singh. All rights reserved.',
                  style: GoogleFonts.spaceMono(
                    fontSize: constraints.maxWidth < 600 ? 12 : 14,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSocialIcon({required IconData icon, required String url}) {
    return GestureDetector(
      onTap: () async {
        if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
          Get.snackbar('Error', 'Could not launch $url');
        }
      },
      child: FaIcon(
        icon,
        size: 30,
        color: Colors.greenAccent.withOpacity(0.9),
      ),
    );
  }
}