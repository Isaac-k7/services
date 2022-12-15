import 'package:flutter/material.dart';

class RouteController {
  /// Logs a [User] into the application
  void register(context) {
    Navigator.of(context).pushNamed('/register');
  }
}
