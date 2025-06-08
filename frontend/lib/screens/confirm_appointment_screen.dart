import 'package:flutter/material.dart';
import '../routes/routes.dart';


class ConfirmAppointmentScreen extends StatelessWidget {
  final String doctor;
  final String date;
  final String time;
  final String doctor_uid;

  const ConfirmAppointmentScreen({
    super.key,
    required this.doctor,
    required this.date,
    required this.time,
    required this.doctor_uid,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Appointment"),
        centerTitle: true,
        leading: BackButton(color: Colors.purple),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Doctor: $doctor", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text("Date: $date", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 12),
            Text("Time: $time", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  // Replace this with the next step
                  Navigator.pushNamed(
                    context,
                    AppRoutes.personalInfo,
                    arguments: {
                      'doctor_name': doctor,
                      'date': date,
                      'time': time,
                      'doctor_uid':doctor_uid
                    },
                  );

                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
