import 'package:flutter/material.dart';
import '../models/doctor_model.dart';

class DoctorProvider with ChangeNotifier {
  Doctor _doctor = Doctor();

  Doctor get doctor => _doctor;

  void updateDoctor({
    String? name,
    String? email,
    String? phone,
    String? clinicAddress,
    String? description,
    String? imagePath,
  }) {
    _doctor = Doctor(
      name: name ?? _doctor.name,
      email: email ?? _doctor.email,
      phoneNumber: phone ?? _doctor.phoneNumber,
      clinicAddress: clinicAddress ?? _doctor.clinicAddress,
      description: description ?? _doctor.description,
      imagePath: imagePath ?? _doctor.imagePath,
    );
    notifyListeners();
  }
}
