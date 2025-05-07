import 'package:flutter/material.dart';
import 'package:petzone_project/screens/login_screen.dart';
import 'package:petzone_project/screens/signup_screen.dart';
import 'package:petzone_project/screens/doctor_profile_screen.dart';
import 'package:petzone_project/screens/Notification_screen.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const SignupPage(),
    );
  }
}

