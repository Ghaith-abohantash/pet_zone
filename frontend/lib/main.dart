import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petzone_project/screens/add_animal_screen.dart';
import 'package:petzone_project/screens/adopt_pet_details_screen.dart';
import 'package:petzone_project/screens/animal_shop_screen.dart';
import 'package:petzone_project/screens/buy_pets_screen.dart';
import 'package:petzone_project/screens/chat_screen.dart';
import 'package:petzone_project/screens/doctor_account_screen.dart';
import 'package:petzone_project/screens/message_screen.dart';
import 'package:petzone_project/screens/pets_details_form.dart';
import 'routes/routes.dart';
import 'package:petzone_project/screens/sale_pet_deatails_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Zone App',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        //to do
      ),
      home: AddAnimalScreen(),

      //   debugShowCheckedModeBanner: false,
    //
    //   initialRoute: AppRoutes.splash,
    //
    //   onGenerateRoute: AppRoutes.generateRoute,
    //
        );
  }
}
