import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/screens/CVPage.dart';
import 'package:myportfolio/screens/LandingPage.dart';
import 'package:myportfolio/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const LandingPage()),
        GetPage(name: '/cv', page: () => const CvPage()), // Placeholder for CV route
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}