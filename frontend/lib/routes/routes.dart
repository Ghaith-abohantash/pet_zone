import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';
import '../screens/home_doctor_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/veterinarian_notification_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/forget _password_screen.dart';
import '../screens/verification_screen.dart';
import '../screens/reset_password_screen.dart';





class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcomePage = '/welcomepage';
  static const String appointmentScreen = '/appointmentScreen';
  static const String veterinariannotificationscreen = '/veterinariannotificationscreen';
  static const String paymentscreen = '/paymentscreen';
  static const String forgetpasswordscreen = '/forgetpasswordscreen';
  static const String verificationscreen = '/verificationscreen';
  static const String resetpasswordscreen = '/resetpasswordscreen';




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
      case paymentscreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case forgetpasswordscreen:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case verificationscreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());
      case resetpasswordscreen:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
