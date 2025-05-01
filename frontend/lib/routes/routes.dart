import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/welcome page_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcomePage = '/welcomepage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
