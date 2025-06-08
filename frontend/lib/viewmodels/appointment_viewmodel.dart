import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/doctor.dart';

class AppointmentViewModel extends ChangeNotifier {
  List<Doctor> doctors = [];
  Doctor? selectedDoctor;

  DateTime? selectedDate;
  String? selectedTime;

  final List<String> times = [
    '8:00', '9:00', '10:00', '11:00',
    '12:00', '1:00', '2:00', '3:00',
  ];

  bool get canContinue =>
      selectedDoctor != null &&
          selectedDate != null &&
          selectedTime != null;

  Future<void> fetchDoctors() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('role', isEqualTo: 'dr')
          .get();

      doctors = snapshot.docs.map((doc) {
        return Doctor(
          uid: doc.id,
          name: doc['name'] ?? '',
        );
      }).toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching doctors: $e');
    }
  }

  void selectDoctor(Doctor? doctor) {
    selectedDoctor = doctor;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void selectTime(String time) {
    selectedTime = time;
    notifyListeners();
  }
}
