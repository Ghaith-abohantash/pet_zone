import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor_model.dart';

class DoctorProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Doctor _doctor = Doctor(id: 'doctor');

  Doctor get doctor => _doctor;

  Future<void> loadDoctor() async {
    final doc = await _db.collection('doctors').doc(_doctor.id).get();
    if (doc.exists) {
      _doctor = Doctor.fromMap(doc.id, doc.data()!);
      notifyListeners();
    }
  }

  Future<void> updateDoctor({
    String? name,
    String? email,
    String? phone,
    String? clinicAddress,
    String? description,
    String? imagePath,
  }) async {
    _doctor = _doctor.copyWith(
      name: name,
      email: email,
      phoneNumber: phone,
      clinicAddress: clinicAddress,
      description: description,
      imagePath: imagePath,
    );
    await _db.collection('doctors').doc(_doctor.id).set(_doctor.toMap());
    notifyListeners();
  }
}
