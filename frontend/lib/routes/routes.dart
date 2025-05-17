import 'package:flutter/material.dart';
import 'package:petzone_project/screens/reset_password_screen.dart';
import 'package:petzone_project/screens/sale_pet_details_screen.dart';
import '../screens/add_animal_screen.dart';
import '../screens/adopt_pet_details_screen.dart';
import '../screens/animal_shop_screen.dart';
import '../screens/buy_pets_screen.dart';
import '../screens/chat_screen.dart';
import '../screens/doctor_account_screen.dart';
import '../screens/doctor_profile_screen.dart';
import '../screens/favorite_screen.dart';
import '../screens/forget _password_screen.dart';
import '../screens/message_screen.dart';
import '../screens/pets_details_form.dart';
import '../screens/signup_screen.dart';
import '../screens/login_screen.dart';
import '../screens/splash_screen.dart';
import '../screens/home_doctor_screen.dart';
import '../screens/user_notification_screen.dart';
import '../screens/verification_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/home_screen.dart';


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
  static const String petZoneHome= '/petZoneHome';
  static const String buyPets= '/buyPets';
  static const String addAnimalPage= '/addAnimalPage';
  static const String animalShopPage= '/animalShopPage';
  static const String chatPage= '/chatPage';
  static const String messagePage= '/messagePage';
  static const String petsDetailsForm= '/petsDetailsForm';
  static const String verificationscreen= '/verificationscreen';
  static const String resetpasswordscreen= '/resetpasswordscreen';
  static const String forgetpasswordscreen= '/forgetpasswordscreen';




  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeDoctorScreen());
      case welcomePage:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case petZoneHome:
        return MaterialPageRoute(builder: (_)=> const HomePage() );
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
      case buyPets:
        return MaterialPageRoute(builder: (_)=> const BuyPets() );
      case addAnimalPage:
        return MaterialPageRoute(builder: (_)=> const AddAnimalScreen() );
      case animalShopPage:
        return MaterialPageRoute(builder: (_)=> const AnimalShopScreen() );
      case chatPage:
        return MaterialPageRoute(builder: (_)=> const ChatPage() );
      case messagePage:
        return MaterialPageRoute(builder: (_)=> const MessagePage() );
      case petsDetailsForm:
        return MaterialPageRoute(builder: (_)=> const PetsDetailsForm () );
      case verificationscreen:
        return MaterialPageRoute(builder: (_)=> const VerificationScreen () );
      case resetpasswordscreen:
        return MaterialPageRoute(builder: (_)=> const ResetPasswordScreen() );
      case forgetpasswordscreen:
        return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen() );
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
