import 'package:flutter/material.dart';

import '../screens/appointment_form_screen.dart';
import '../screens/confirm_appointment_screen.dart';
import '../screens/empty_appointment_view.dart';
import '../screens/personal_info_screen.dart';
import '../screens/upcoming_appointments_screen.dart';
import '../screens/cancelled_appointments_screen.dart';
import '../screens/empty_cart_screen.dart';
import '../screens/cart_screen.dart';
class AppRoutess {
  static const String appointmentForm = '/form';
  static const String confirm = '/confirm';
  static const String personalInfo = '/personal-info';
  static const String empty = '/empty';
  static const String upcoming = '/upcoming';
  static const String cancelled = '/cancelled';
  static const String emptyCart = '/cart';
  static const String cart = '/full-cart';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case appointmentForm:
        return MaterialPageRoute(
          builder: (_) => const AppointmentFormScreen(),
        );

      case confirm:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) =>
              ConfirmAppointmentScreen(
                doctor: args['doctor'],
                date: args['date'],
                time: args['time'],
              ),
        );

      case personalInfo:
        return MaterialPageRoute(
          builder: (_) => const PersonalInfoScreen(),
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
        return null;
    }
}}