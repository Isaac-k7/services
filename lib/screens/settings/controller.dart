import 'package:flutter/material.dart';

class Controller {
  static Future<void> navigateToWelcome(context ) async {
    Navigator.pushNamedAndRemoveUntil(context,'/welcome', (route) => false);
  }
}
