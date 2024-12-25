import 'package:flutter/material.dart';
import 'package:recipe_app2/view/AddRecipeScreen.dart';

class Functions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
