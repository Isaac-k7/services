import 'package:flutter/material.dart';

class RouteController {
  /// Logs a [User] into the application
  void favorites(context) {
    Navigator.of(context).pushNamed('/favorites');
  }
  void settings(context) {
    Navigator.of(context).pushNamed('/settings');
  }
  void profile(context) {
    Navigator.of(context).pushNamed('/profile');
  }
  void notifications(context) {
    Navigator.of(context).pushNamed('/notifications');
  }
  void home(context) {
    Navigator.of(context).pushNamed('/home');
  }
  void register(context) {
    Navigator.of(context).pushNamed('/register');
  }
  void login(context) {
    Navigator.of(context).pushNamed('/login');
  }
  void welcom(context) {
    Navigator.of(context).pushNamed('/welcom');
  }
  void splash(context) {
    Navigator.of(context).pushNamed('/splash');
  }
}
