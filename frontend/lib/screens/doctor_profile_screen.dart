import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/doctor_provider.dart';
import '../widgets/doctor_app_bar.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final doctor = Provider.of<DoctorProvider>(context).doctor;

    return Scaffold(
      appBar: const DoctorAppBar(title: "Doctor Profile"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  margin: const EdgeInsets.only(top: 40),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: doctor.imagePath != null
                          ? FileImage(File(doctor.imagePath!))
                          : const AssetImage('assets/images/doctor_profile.png')
                      as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              Center(
                child: Text(
                  doctor.name.isNotEmpty ? 'Dr. ${doctor.name}' : '',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 24),

              const Text("Email", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              _infoBox(doctor.email),

              const SizedBox(height: 16),
              const Text("Phone number", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              _infoBox(doctor.phoneNumber),

              const SizedBox(height: 16),
              const Text("Clinic Address", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              _infoBox(doctor.clinicAddress),

              const SizedBox(height: 24),
              Text(
                doctor.name.isNotEmpty ? "About Dr. ${doctor.name}" : "About Doctor",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                doctor.description,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        value.isNotEmpty ? value : '-',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
