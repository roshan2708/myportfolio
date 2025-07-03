import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myportfolio/widgets/NavigationBar.dart';

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<NavigationItem> navItems = [
    NavigationItem(icon: Icons.home, label: "Home"),
    NavigationItem(icon: Icons.code, label: "Skills"),
    NavigationItem(icon: Icons.computer, label: "Technologies"),
    NavigationItem(icon: Icons.work, label: "Projects"),
    NavigationItem(icon: Icons.contact_mail, label: "Contact"),
  ];

  void onItemTapped(int index) {
    selectedIndex.value = index;
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
}