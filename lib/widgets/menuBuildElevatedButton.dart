import 'package:flutter/material.dart';
import 'package:recipe_app2/Functions/functions.dart';

Widget menuBuildElevatedButton(BuildContext context, Widget screen,
    {required IconData icon, required String label, required Color color}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20), // Yüksekliği azaltarak butonları eşitleyebiliriz
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: color,
      shadowColor: Colors.black.withOpacity(0.2),
      elevation: 5,
      minimumSize: Size(
          double.infinity, 60), // Minimum boyutu tüm butonlar için aynı yapar
    ),
    icon: Icon(icon, color: Colors.white),
    label:
        Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)),
    onPressed: () {
      Functions.navigateToScreen(context, screen);
    },
  );
}
