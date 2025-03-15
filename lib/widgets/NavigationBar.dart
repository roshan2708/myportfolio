import 'dart:ui';
import 'package:flutter/material.dart';

// Define a class to keep track of section keys
class SectionKeys {
  static final GlobalKey homeKey = GlobalKey();
  static final GlobalKey skillsKey = GlobalKey();
  static final GlobalKey technologiesKey = GlobalKey();
  static final GlobalKey projectsKey = GlobalKey();
  static final GlobalKey aboutKey = GlobalKey();
}

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});

  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int _selectedIndex = 0; // Track the selected index, default to Home

  // List of navigation items that match your landing page sections
  final List<NavigationItem> _navItems = [
    NavigationItem(icon: Icons.home, label: "Home"),
    NavigationItem(icon: Icons.code, label: "Skills"),
    NavigationItem(icon: Icons.computer, label: "Technologies"),
    NavigationItem(icon: Icons.work, label: "Projects"),
    NavigationItem(icon: Icons.contact_mail, label: "Contact"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    
    // Get the right key based on the selected index
    GlobalKey targetKey;
    switch (index) {
      case 0:
        targetKey = SectionKeys.homeKey;
        break;
      case 1:
        targetKey = SectionKeys.skillsKey;
        break;
      case 2:
        targetKey = SectionKeys.technologiesKey;
        break;
      case 3:
        targetKey = SectionKeys.projectsKey;
        break;
      case 4:
        targetKey = SectionKeys.aboutKey;
        break;
      default:
        targetKey = SectionKeys.homeKey;
    }

    // Scroll to the target section
    final context = targetKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        alignment: 0.0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.6,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_navItems.length, (index) {
                  return NavigationButton(
                    icon: _navItems[index].icon,
                    text: _navItems[index].label,
                    isSelected: _selectedIndex == index,
                    onTap: () => _onItemTapped(index),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Simple class to hold navigation item data
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
  }) : assert(icon != null || text != null, "Either icon or text must be provided!");

  @override
  Widget build(BuildContext context) {
    // Dark violet color for selected items, white for unselected
    final Color selectedColor = const Color.fromARGB(255, 138, 216, 35); // Dark violet
    final Color unselectedColor = Colors.white;
    
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? selectedColor.withOpacity(0.2) : Colors.transparent,
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
            if (text != null && icon != null)
              const SizedBox(width: 4),
            if (text != null)
              Text(
                text!,
                style: TextStyle(
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