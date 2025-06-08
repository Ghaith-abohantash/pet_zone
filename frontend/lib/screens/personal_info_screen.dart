import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  final String doctor_name;
  final String date;
  final String time;
  final String doctor_uid;

  const PersonalInfoScreen({
    super.key,
    required this.doctor_name,
    required this.date,
    required this.time,
  required this.doctor_uid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.deepPurple),
        title: const Text("Book Appointment"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Enter Your Details",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 24),


            Text("Doctor: $doctor_name"),
            Text("Date: $date"),
            Text("Time: $time"),


            const SizedBox(height: 24),
            const Text("Full Name"),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: "name",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Email"),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                hintText: "name@example.com",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Phone Number"),
            const SizedBox(height: 8),
            const TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "059XXXXXXXX",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // حفظ الموعد أو التنقل للخطوة التالية
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
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
