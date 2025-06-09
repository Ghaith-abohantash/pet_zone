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
import '../screens/user_account_screen.dart';
import '../screens/user_notification_screen.dart';
import '../screens/verification_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/appointments_screen.dart';
import '../screens/home_screen.dart';
import '../screens/appointment_form_screen.dart';
import '../screens/confirm_appointment_screen.dart';
import '../screens/empty_appointment_view.dart';
import '../screens/personal_info_screen.dart';
import '../screens/upcoming_appointments_screen.dart';
import '../screens/cancelled_appointments_screen.dart';
import '../screens/empty_cart_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/veterinarian_notification_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/adopt_pet_details_screen.dart';


class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String welcomePage = '/welcomepage';
  static const String payment = '/payment';

  static const String appointmentScreen= '/appointmentScreen';
  static const String useraccount= '/useraccount';

  static const String logIn= '/logIn';
  static const String signUp= '/signUp';
  static const String doctorProfilePage= '/doctorProfilePage';
  static const String doctorAccountPage= '/doctorAccountPage';
  static const String userNotification= '/userNotification';
  static const String favorite= '/favorite';
  static const String saleDetails= '/saleDetails';
  static const String adoptDetails= '/adoptDetails';
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
  static const String doctornotification= '/doctornotification';
  static const String appointmentForm = '/form';
  static const String confirm = '/confirm';
  static const String personalInfo = '/personal-info';
  static const String empty = '/empty';
  static const String upcoming = '/upcoming';
  static const String cancelled = '/cancelled';
  static const String emptyCart = '/cart';
  static const String cart = '/full-cart';
  static const String userAccountPage = '/userAccountPage';


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
        return MaterialPageRoute(builder: (_)=>  AppointmentScreen() );
      case logIn:
        return MaterialPageRoute(builder: (_)=> const LogInPage() );
      case signUp:
        return MaterialPageRoute(builder: (_)=> const SignupPage() );
      case payment:
        return MaterialPageRoute(builder: (_)=> const PaymentScreen() );
      case doctorProfilePage:
        return MaterialPageRoute(builder: (_)=> const DoctorProfilePage() );
      case doctorAccountPage:
        return MaterialPageRoute(builder: (_)=> const DoctorAccountPage() );
      case userAccountPage:
        return MaterialPageRoute(builder: (_)=> const UserAccountPage() );

      case userNotification:
        return MaterialPageRoute(builder: (_)=> const UserNotificationPage() );
      case favorite:
        return MaterialPageRoute(builder: (_)=> const FavoritePage() );
      case doctornotification:
        return MaterialPageRoute(builder: (_)=> const VeterinarianNotificationScreen() );
      case saleDetails:
        {
          final petId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => SalePetDetailsScreen(petId: petId),
          );
        }
      case adoptDetails:
        {
          final adoptPetId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (_) => AdoptPetDetailsScreen(adoptPetId: adoptPetId),
          );
        }

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
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => PetsDetailsForm(
            doctor_name: args['doctor_name'],
            doctor_uid: args['doctor_uid'],
            date: args['date'],
            time: args['time'],
            user_name: args['user_name'],
            email: args['email'],
            phone: args['phone'],
          ),
        );
      case verificationscreen:
        return MaterialPageRoute(builder: (_)=> const VerificationScreen () );
      case resetpasswordscreen:
        return MaterialPageRoute(builder: (_)=> const ResetPasswordScreen() );
      case forgetpasswordscreen:
        return MaterialPageRoute(builder: (_)=> const ForgetPasswordScreen() );

      case appointmentForm:
        return MaterialPageRoute(
          builder: (_) => const AppointmentFormScreen(),
        );

      case confirm:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => ConfirmAppointmentScreen(
                doctor_name: args['doctor_name'],
                date: args['date'],
                time: args['time'],
                doctor_uid: args['doctor_uid'],
                ),
            );

      case personalInfo:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => PersonalInfoScreen(
                doctor_name: args['doctor_name'],
                date: args['date'],
                time: args['time'],
                doctor_uid: args['doctor_uid'],
               ),
           );
      case empty:
        return MaterialPageRoute(
          builder: (_) => const EmptyAppointmentView(),
        );

      case upcoming:
        return MaterialPageRoute(
          builder: (_) => const UpcomingAppointmentsScreen(),
        );

      case cancelled:
        return MaterialPageRoute(
          builder: (_) => const CancelledAppointmentsScreen(),
        );

      case emptyCart:
        return MaterialPageRoute(
          builder: (_) => const EmptyCartScreen(),
        );

      case cart:
        return MaterialPageRoute(
          builder: (_) => const CartScreen(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}