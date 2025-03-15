import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6, // 60% of screen height
      color: Colors.transparent, // Transparent container
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dart',
            style: TextStyle(
              color: Color.fromRGBO(148, 0, 211, 0.5), // Violet with 50% opacity
              fontSize: 90,
            ),
          ),
          SizedBox(height: 20), // Spacing between texts
          Text(
            'Flutter',
            style: TextStyle(
              color: Color.fromRGBO(148, 0, 211, 0.75), // Violet with 75% opacity
              fontSize: 90,
            ),
          ),
          SizedBox(height: 20), // Spacing between texts
          Text(
            'Coffee',
            style: TextStyle(
              color: Color.fromRGBO(148, 0, 211, 1.0), // Violet with 100% opacity
              fontSize: 90,
            ),
          ),
        ],
      ),
    );
  }
}