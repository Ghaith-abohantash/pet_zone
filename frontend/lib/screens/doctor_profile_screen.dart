import 'package:flutter/material.dart';

import '../widgets/doctor_app_bar.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DoctorAppBar(title: "Doctor Account"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          margin: EdgeInsets.only(top: 40),
                          child: Image.asset(
                            'assets/images/doctor_profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 28),

                      Center(
                        child: Text(
                          "DR: Abu Al Noor 😎",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(height: 24),


                      Text("Email", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "name@example.com",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),


                      Text("Phone number", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "05988XXXXX",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),


                      Text("Clinic Address", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Nablus",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),


                      Text(
                        "About Dr. Abu Al Noor",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Dr. Abu Al Noor is a highly skilled and compassionate veterinarian with years of experience in treating pets and livestock. "
                            "He specializes in pet healthcare, preventive medicine, and emergency treatments. Dr. Abu Al Noor is dedicated to ensuring the "
                            "well-being of animals, providing expert care, and educating pet owners on proper pet maintenance.",
                        style: TextStyle(fontSize: 16, color: Colors.black87),
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
