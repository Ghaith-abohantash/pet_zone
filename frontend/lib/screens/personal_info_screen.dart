import 'package:flutter/material.dart';
import '../routes/routes.dart';

class PersonalInfoScreen extends StatefulWidget {
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
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  void _goToPetDetailsForm() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || email.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    Navigator.pushNamed(
      context,
      AppRoutes.petsDetailsForm,

      arguments: {
        'doctor_name': widget.doctor_name,
        'doctor_uid': widget.doctor_uid,
        'date': widget.date,
        'time': widget.time,
        'user_name': name,
        'email': email,
        'phone': phone,
      },
    );
  }

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
            Text("Doctor: ${widget.doctor_name}"),
            Text("Date: ${widget.date}"),
            Text("Time: ${widget.time}"),
            const SizedBox(height: 24),

            const Text("Full Name"),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Your name",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Email"),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "name@example.com",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color(0xFFF4F4F4),
              ),
            ),

            const SizedBox(height: 16),
            const Text("Phone Number"),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
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
                onPressed: _goToPetDetailsForm,
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
