import 'package:flutter/material.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/widgets/CustomCard.dart';
import 'package:myportfolio/widgets/CustomContainer.dart';
import 'package:myportfolio/widgets/Footer.dart';
import 'package:myportfolio/widgets/HeroSection.dart';
import 'package:myportfolio/widgets/InfoConatainer.dart';
import 'package:myportfolio/widgets/NavigationBar.dart';
import 'package:myportfolio/widgets/ProjectCard.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Stack(
        children: [
          // Scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                // Add padding at the top to prevent content from being hidden under navigation
                SizedBox(height: 100), // Adjust this value based on your NavigationWidget height
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Home Section
                      Container(
                        key: SectionKeys.homeKey,
                        child: Herosection(),
                      ),
                      
                      // Skills Section
                      Container(
                        key: SectionKeys.skillsKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40, bottom: 20),
                                child: Text(
                                  "Skills",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomSkillCard(
                                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/128px-Flutter_logo.svg.png?20230821075714",
                                      text: "Flutter",
                                      cardColor: AppColors.color1),
                                    CustomSkillCard(
                                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
                                      text: "Dart",
                                      cardColor: AppColors.color2),
                                    CustomSkillCard(
                                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1024px-Go_Logo_Blue.svg.png",
                                      text: "GoLang",
                                      cardColor: AppColors.color3),
                                    CustomSkillCard(
                                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Firebase_icon.svg/240px-Firebase_icon.svg.png",
                                      text: "Firebase",
                                      cardColor: AppColors.color4),
                                    CustomSkillCard(
                                      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png",
                                      text: "Python",
                                      cardColor: AppColors.color5),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Centered CustomContainer
                      Center(child: CustomContainer()),
                      
                      // Technologies Section
                      Container(
                        key: SectionKeys.technologiesKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Technologies\nI Use",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      InfoContainer(
                                        title: 'Front-end Engineer & Design',
                                        imageLocations: [
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/128px-Flutter_logo.svg.png?20230821075714',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Firebase_icon.svg/240px-Firebase_icon.svg.png',
                                          'https://plugins.jetbrains.com/files/12129/612258/icon/default.png',
                                          'https://raw.githubusercontent.com/jonataslaw/getx/master/screenshots/getx-logo.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Visual_Studio_Code_1.35_icon.svg/2048px-Visual_Studio_Code_1.35_icon.svg.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Figma-logo.svg/1667px-Figma-logo.svg.png',
                                          'https://upload.wikimedia.org/wikipedia/en/thumb/b/bb/Canva_Logo.svg/1280px-Canva_Logo.svg.png',
                                        ],
                                        technologies: [
                                          'Flutter',
                                          'Firebase',
                                          'Bloc',
                                          'GetX',
                                          'VS Code',
                                          'Figma',
                                          'Canva',
                                        ],
                                      ),
                                      const SizedBox(width: 45),
                                      InfoContainer(
                                        title: 'Programming Languages',
                                        imageLocations: [
                                          'https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1024px-Go_Logo_Blue.svg.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/6/6a/JavaScript-logo.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/1/19/C_Logo.png',
                                          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/ISO_C%2B%2B_Logo.svg/1200px-ISO_C%2B%2B_Logo.svg.png',
                                        ],
                                        technologies: [
                                          'Dart',
                                          'Go Lang',
                                          'Python',
                                          'JavaScript',
                                          'C',
                                          'C++',
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Projects Section
                      Container(
                        key: SectionKeys.projectsKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Featured\nProjects",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(width: 50),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      ProjectCard(
                                        title: "Personalyze",
                                        description: "An AI-powered personality analysis app using live camera & microphone input. Generates detailed reports and personality scores.",
                                        assetImage: 'assets/images/profile.jpg',
                                        githubUrl: "https://github.com/yourusername/personalyze",
                                      ),
                                      SizedBox(width: 20),
                                      ProjectCard(
                                        title: "COVID-19 Tracker",
                                        description: "A real-time tracker that provides live COVID-19 statistics, safety guidelines, and preventive measures.",
                                        
                                        githubUrl: "https://github.com/yourusername/covid-tracker", assetImage: 'assets/images/profile.jpg',
                                      ),
                                      SizedBox(width: 20),
                                      ProjectCard(
                                        title: "DefiniteIt",
                                        description: "An advanced dictionary app with AI-powered definitions, word suggestions, and vocabulary-building features.",
                                       
                                        githubUrl: "https://github.com/yourusername/definiteit", assetImage: 'assets/images/profile.jpg',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Contact/About Section (Footer)
                      Container(
                        key: SectionKeys.aboutKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PortfolioFooter(),
              ],
            ),
          ),
          
          // Fixed Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 55),
              color: AppColors.bgColor, // Match background color
              child: NavigationWidget(),
            ),
          ),
        ],
      ),
    );
  }
}