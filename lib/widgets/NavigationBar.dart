import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myportfolio/NavigationController.dart';

class SectionKeys {
  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey technologiesKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
}

class NavigationWidget extends StatelessWidget {
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: constraints.maxWidth < 600 ? constraints.maxWidth * 0.9 : constraints.maxWidth * 0.6,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.8),
                  border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.greenAccent.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(navController.navItems.length, (index) {
                    return NavigationButton(
                      icon: navController.navItems[index].icon,
                      text: navController.navItems[index].label,
                      isSelected: navController.selectedIndex.value == index,
                      onTap: () => navController.onItemTapped(index),
                    );
                  }),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavigationItem {
  final IconData icon;
  final String label;

  NavigationItem({required this.icon, required this.label});
}

class NavigationButton extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final bool isSelected;
  final VoidCallback onTap;

  const NavigationButton({
    super.key,
    this.icon,
    this.text,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Colors.greenAccent;
    final Color unselectedColor = Colors.white;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? selectedColor.withOpacity(0.2) : Colors.transparent,
          border: Border.all(
            color: isSelected ? selectedColor.withOpacity(0.5) : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: 20,
                color: isSelected ? selectedColor : unselectedColor,
              ),
            if (text != null && icon != null) const SizedBox(width: 4),
            if (text != null)
              Text(
                text!,
                style: GoogleFonts.spaceMono(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  color: isSelected ? selectedColor : unselectedColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}