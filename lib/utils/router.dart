import 'package:flutter/material.dart';

import 'package:achilleservice/screens/screens.dart';

class MyRouter{
  final RouteObserver<PageRoute> routeObserver;
  MyRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic>?  getRoute(RouteSettings settings){
    switch (settings.name){
      case Screens.register:
        return _buildRoute(settings, const Register());
      case Screens.login:
        return _buildRoute(settings, const Login());
      default:
    return null;
    }
    }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
  }

}