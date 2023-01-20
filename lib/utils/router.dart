import 'package:flutter/material.dart';

import 'package:achilleservice/screens/screens.dart';

const _homeTabKey = Key('homeTabs');

class MyRouter{
  final RouteObserver<PageRoute> routeObserver;
  MyRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic>?  getRoute(RouteSettings settings){
    switch (settings.name){
      case Screens.favorites:
      case Screens.settings:
      case Screens.profile:
      case Screens.notifications:
      case Screens.home:
        return _buildRoute(
          settings,
          HomeBasePage(
            key: _homeTabKey,
            initialSettings: settings,
          ),
        );
      case Screens.register:
        return _buildRoute(settings, const Register());
      case Screens.login:
        return _buildRoute(settings, const Login());
      case Screens.welcome:
        return _buildRoute(settings, const Welcome());
      case Screens.splash:
        return _buildRoute(settings, const SplashPage());
      default:
    return null;
    }
    }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
  }

}