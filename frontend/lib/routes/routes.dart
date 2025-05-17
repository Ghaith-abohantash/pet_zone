import 'package:flutter/material.dart';
import 'package:petzone_project/screens/sale_pet_details_screen.dart';
import '../screens/adopt_pet_details_screen.dart';
import '../screens/doctor_account_screen.dart';
import '../screens/doctor_profile_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/home_doctor_screen.dart';
import '../screens/user_notification_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/appointments_screen.dart';


class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcomePage = '/welcomepage';
  static const String appointmentScreen= '/appointmentScreen';
  static const String logIn= '/logIn';
  static const String signUp= '/signUp';
  static const String doctorProfilePage= '/doctorProfilePage';
  static const String doctorAccountPage= '/doctorAccountPage';
  static const String userNotification= '/userNotification';
  static const String favorite= '/favorite';
  static const String saleDetails= '/saleDetails';
  static const String adoptDetails= '/saleDetails';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeDoctorScreen());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case appointmentScreen:
        return MaterialPageRoute(builder: (_)=> const AppointmentScreen() );
      case logIn:
        return MaterialPageRoute(builder: (_)=> const LogInPage() );
      case signUp:
        return MaterialPageRoute(builder: (_)=> const SignupPage() );
      case doctorProfilePage:
        return MaterialPageRoute(builder: (_)=> const DoctorProfilePage() );
      case doctorAccountPage:
        return MaterialPageRoute(builder: (_)=> const DoctorAccountPage() );
      case userNotification:
        return MaterialPageRoute(builder: (_)=> const UserNotificationPage() );
      case favorite:
        return MaterialPageRoute(builder: (_)=> const FavoritePage() );
      case saleDetails:
        return MaterialPageRoute(builder: (_)=> const SaleDetailsPage() );
      case adoptDetails:
        return MaterialPageRoute(builder: (_)=> const AdoptDetailsPage() );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}