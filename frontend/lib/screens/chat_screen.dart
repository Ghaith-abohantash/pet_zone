import 'package:flutter/material.dart';

import '../routes/routes.dart';
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double spacingBetweenMessages = 24.0; // Bigger spacing

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF5E2A6F), // Back button color
        ),
        title: const Text(
          'Dr.Noor Kusa',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                decoration: BoxDecoration(
                  color: Color(0xFF5E2A6F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Hello doctor how is my pet',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center, // Align icon and text vertically
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, AppRoutes.doctorProfilePage);
                  },
                child:Image.asset(
                  'assets/images/doctor_profile.png',
                  width: 30,
                  height: 30,
                ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                    decoration: BoxDecoration(
                      color: Color(0xFF7A7A7A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Do you mean mizo? it\'s very good now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                decoration: BoxDecoration(
                  color: Color(0xFF5E2A6F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Oh great can I take her to the home?',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/doctor_profile.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                    decoration: BoxDecoration(
                      color: Color(0xFF7A7A7A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Sorry, but after one week you can',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                decoration: BoxDecoration(
                  color: Color(0xFF5E2A6F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Okay doctor thank you',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/doctor_profile.png',
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: spacingBetweenMessages),
                    decoration: BoxDecoration(
                      color: Color(0xFF7A7A7A),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'You are welcome',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}