import 'package:flutter/material.dart';
import '../widgets/doctor_app_bar.dart';

class DoctorAccountPage extends StatelessWidget {
  const DoctorAccountPage({super.key});

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

                      const SizedBox(height: 24),
                      Text("Name", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Noor Kusa",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

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
                      Text("Description", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: TextField(
                          maxLines: null,
                          expands: true,
                          decoration: InputDecoration(
                            hintText: "description about doctor",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                            ),
                          ),
                        ),
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

