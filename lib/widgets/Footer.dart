import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class PortfolioFooter extends StatefulWidget {
  const PortfolioFooter({Key? key}) : super(key: key);

  @override
  _PortfolioFooterState createState() => _PortfolioFooterState();
}

class _PortfolioFooterState extends State<PortfolioFooter> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  Future<void> _sendEmail() async {
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a message')),
      );
      return;
    }

    setState(() => _isLoading = true);

    final String subject = Uri.encodeComponent('Message from Portfolio');
    final String body = Uri.encodeComponent(_emailController.text);
    final String emailUrl = 'mailto:rs602543@gmail.com?subject=$subject&body=$body';

    try {
      if (await canLaunchUrl(Uri.parse(emailUrl))) {
        await launchUrl(Uri.parse(emailUrl));
        _emailController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Opening email client...')),
        );
      } else {
        throw 'Could not launch email client';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.black.withOpacity(0.8), // Dark background for contrast
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Get in Touch',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
        
            // Email Text Field
            TextField(
              controller: _emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Enter your message...',
                hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                filled: true,
                fillColor: Colors.white.withOpacity(0.1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                suffixIcon: IconButton(
                  icon: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Icon(Icons.send, color: Colors.white),
                  onPressed: _isLoading ? null : _sendEmail,
                ),
              ),
              maxLines: 1,
            ),
            const SizedBox(height: 20),
        
            // Connectivity Icons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://wa.me/yourphonenumber'), mode: LaunchMode.externalApplication),
        child: const Icon(Icons.call, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 20),
            GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://linkedin.com/in/yourusername'), mode: LaunchMode.externalApplication),
        child: const Icon(Icons.business, color: Colors.white, size: 30), // LinkedIn Alternative
            ),
            const SizedBox(width: 20),
            GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://x.com/yourusername'), mode: LaunchMode.externalApplication),
        child: const Icon(Icons.alternate_email, color: Colors.white, size: 30), // X/Twitter Alternative
            ),
            const SizedBox(width: 20),
            GestureDetector(
        onTap: () => launchUrl(Uri.parse('https://instagram.com/yourusername'), mode: LaunchMode.externalApplication),
        child: const Icon(Icons.camera_alt, color: Colors.white, size: 30), // Instagram Alternative
            ),
          ],
        ),
        
        
            const SizedBox(height: 20),
        
            // Copyright
            Center(
              child: Text(
                '© ${DateTime.now().year} Roshan Singh. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon({required IconData icon, required String url}) {
    return GestureDetector(
      onTap: () => _launchUrl(url),
      child: FaIcon(
        icon,
        size: 30,
        color: Colors.white.withOpacity(0.9),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}