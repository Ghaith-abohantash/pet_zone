import 'package:flutter/material.dart';
import 'dart:async';
import '../routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.jpg',
              width: screenWidth * 0.4,
              height: screenHeight * 0.25,
              fit: BoxFit.contain,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              'Pet Zone',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: screenWidth * 0.07,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
