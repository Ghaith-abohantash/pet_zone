import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_doctor_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/veterinarian_notification_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcomePage = '/welcomepage';
  static const String appointmentScreen = '/appointmentScreen';
  static const String veterinariannotificationscreen = '/veterinariannotificationscreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeDoctorScreen());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case appointmentScreen:
        return MaterialPageRoute(builder: (_) => const AppointmentScreen());
      case veterinariannotificationscreen:
        return MaterialPageRoute(builder: (_) => const VeterinarianNotificationScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
