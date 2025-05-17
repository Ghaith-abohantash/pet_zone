import 'package:flutter/material.dart';
import '../widgets/doctor_app_bar.dart';

class DoctorAccountPage extends StatelessWidget {
  const DoctorAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
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
                      const SizedBox(height: 40),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/doctor_profile.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(6),
                                child: Icon(
                                  Icons.add_photo_alternate,
                                  size: 24,
                                  color: Color(0xFF5E2A6F),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      Text("Name", style: TextStyle(fontSize: 18)),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Noor Kusa",
                          suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
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
                          suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
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
                          suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
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
                          suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
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
                            suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
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
