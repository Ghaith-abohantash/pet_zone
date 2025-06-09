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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: doctor.imagePath != null
                      ? FileImage(File(doctor.imagePath!))
                      : const AssetImage('assets/images/doctor_profile.png')
                  as ImageProvider,
                ),
              ),
              const SizedBox(height: 28),
              Text(
                doctor.name.isNotEmpty ? 'Dr. ${doctor.name}' : '',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 24),
              _readOnlyField(label: "Email", value: doctor.email),
              const SizedBox(height: 16),
              _readOnlyField(label: "Phone number", value: doctor.phoneNumber),
              const SizedBox(height: 16),
              _readOnlyField(label: "Clinic Address", value: doctor.clinicAddress),
              const SizedBox(height: 24),
              _readOnlyField(
                label: "About Dr. ${doctor.name}",
                value: doctor.description,
                maxLines: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _readOnlyField({
    required String label,
    required String value,
    int maxLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: TextEditingController(text: value),
          readOnly: true,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          ),
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}
