import 'package:flutter/material.dart';

class BuildNavBarItem {
  static BottomNavigationBarItem build(
      IconData icon, String label, int selectedIndex, int currentIndex) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: currentIndex == selectedIndex
              ? Colors.deepOrange.withOpacity(0.2)
              : Colors.transparent,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(icon),
      ),
      label: label,
    );
  }
}
