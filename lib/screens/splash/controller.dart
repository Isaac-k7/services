import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';


class Controller {

    static Future<bool> isThereInitialUri() async {
    final appLinks = AppLinks();
    String? uri = await appLinks.getInitialAppLinkString();
    return uri != null && uri.isNotEmpty;
  }
    static Future<void> navigateToWelcome(context) async {
    if (await isThereInitialUri() == false) {
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
    }
  }

  static Future<void> navigateToHome(context) async {
    if (await isThereInitialUri() == false) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }
}