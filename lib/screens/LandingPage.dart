import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/NavigationController.dart';
import 'package:myportfolio/constants/colors.dart';
import 'package:myportfolio/widgets/CustomCard.dart';
import 'package:myportfolio/widgets/CustomContainer.dart';
import 'package:myportfolio/widgets/Footer.dart';
import 'package:myportfolio/widgets/HeroSection.dart';
import 'package:myportfolio/widgets/InfoConatainer.dart';
import 'package:myportfolio/widgets/NavigationBar.dart';
import 'package:myportfolio/widgets/ProjectCard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.put(NavigationController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    double padding = constraints.maxWidth < 600 ? 16 : 55;
                    return Column(
                      children: [
                        SizedBox(height: constraints.maxWidth < 600 ? 80 : 100),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                key: SectionKeys.homeKey,
                                child: const HeroSection(),
                              ),
                              Container(
                                key: SectionKeys.skillsKey,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: padding),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Skills",
                                        style: GoogleFonts.spaceMono(
                                          color: Colors.white,
                                          fontSize: constraints.maxWidth < 600 ? 36 : 56,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.5,
                                          shadows: [
                                            Shadow(
                                              blurRadius: 15.0,
                                              color: AppColors.neonGlow,
                                              offset: const Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      SizedBox(
                                        width: constraints.maxWidth,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: const [
                                              CustomSkillCard(
                                                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flutter_logo.svg/128px-Flutter_logo.svg.png?20230821075714",
                                                text: "Flutter",
                                                cardColor: AppColors.color1,
                                              ),
                                              CustomSkillCard(
                                                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png",
                                                text: "Dart",
                                                cardColor: AppColors.color2,
                                              ),
                                              CustomSkillCard(
                                                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Go_Logo_Blue.svg/1024px-Go_Logo_Blue.svg.png",
                                                text: "GoLang",
                                                cardColor: AppColors.color3,
                                              ),
                                              CustomSkillCard(
                                                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Firebase_icon.svg/240px-Firebase_icon.svg.png",
                                                text: "Firebase",
                                                cardColor: AppColors.color4,
                                              ),
                                              CustomSkillCard(
                                                imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1869px-Python-logo-notext.svg.png",
                                                text: "Python",
                                                cardColor: AppColors.color5,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Center(child: const CustomContainer()),
                              Container(
                                key: SectionKeys.technologiesKey,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                                  child: constraints.maxWidth < 600
                                      ? Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Technologies\nI Use",
                                              style: GoogleFonts.spaceMono(
                                                color: Colors.white,
                                                fontSize: constraints.maxWidth < 600 ? 36 : 56,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 15.0,
                                                    color: AppColors.neonGlow,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            SizedBox(
                                              width: constraints.maxWidth,
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: const [
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
                                                    SizedBox(width: 20),
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
                                        )
                                      : Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Technologies\nI Use",
                                              style: GoogleFonts.spaceMono(
                                                color: Colors.white,
                                                fontSize: constraints.maxWidth < 600 ? 36 : 56,
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1.5,
                                                shadows: [
                                                  Shadow(
                                                    blurRadius: 15.0,
                                                    color: AppColors.neonGlow,
                                                    offset: const Offset(0, 0),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 50),
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.horizontal,
                                                child: Row(
                                                  children: const [
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
                                                    SizedBox(width: 45),
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
                            Container(
                              key: SectionKeys.projectsKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
                                child: constraints.maxWidth < 600
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Featured\nProjects",
                                            style: GoogleFonts.spaceMono(
                                              color: Colors.white,
                                              fontSize: constraints.maxWidth < 600 ? 36 : 56,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 15.0,
                                                  color: AppColors.neonGlow,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          SizedBox(
                                            width: constraints.maxWidth,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children:  [
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
                                                    githubUrl: "https://github.com/yourusername/covid-tracker",
                                                    assetImage: 'assets/images/profile.jpg',
                                                  ),
                                                  SizedBox(width: 20),
                                                  ProjectCard(
                                                    title: "DefiniteIt",
                                                    description: "An advanced dictionary app with AI-powered definitions, word suggestions, and vocabulary-building features.",
                                                    githubUrl: "https://github.com/yourusername/definiteit",
                                                    assetImage: 'assets/images/profile.jpg',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    : Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Featured\nProjects",
                                            style: GoogleFonts.spaceMono(
                                              color: Colors.white,
                                              fontSize: constraints.maxWidth < 600 ? 36 : 56,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.5,
                                              shadows: [
                                                Shadow(
                                                  blurRadius: 15.0,
                                                  color: AppColors.neonGlow,
                                                  offset: const Offset(0, 0),
                                                ),
                                              ],
                                            ),
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
                                                    githubUrl: "https://github.com/yourusername/covid-tracker",
                                                    assetImage: 'assets/images/profile.jpg',
                                                  ),
                                                  SizedBox(width: 20),
                                                  ProjectCard(
                                                    title: "DefiniteIt",
                                                    description: "An advanced dictionary app with AI-powered definitions, word suggestions, and vocabulary-building features.",
                                                    githubUrl: "https://github.com/yourusername/definiteit",
                                                    assetImage: 'assets/images/profile.jpg',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                            Container(
                              key: SectionKeys.aboutKey,
                              child: const SizedBox(height: 40),
                            ),
                          ],
                        ),
                      ),
                      const PortfolioFooter(),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 600 ? 16 : 55),
              decoration: BoxDecoration(
                gradient: AppColors.navGradient,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.neonGlow.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const NavigationWidget(),
            ),
          ),
        ],
      ),
    ));
  }
}