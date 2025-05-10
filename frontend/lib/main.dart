import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      home: SaleDetailsPage(),
      //   debugShowCheckedModeBanner: false,
    //
    //   initialRoute: AppRoutes.splash,
    //
    //   onGenerateRoute: AppRoutes.generateRoute,
    //
        );
  }
}
