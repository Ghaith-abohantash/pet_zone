import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class SaleDetailsViewModel with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late PetModel _pet;
  bool _isLoading = false;

  PetModel get pet => _pet;
  bool get isLoading => _isLoading;

  Future<void> fetchPetById(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      final doc = await _firestore.collection('pets').doc(id).get();
      if (doc.exists) {
        _pet = PetModel.fromMap(doc.data()!, doc.id);
      }
    } catch (e) {
      print("Error fetching pet: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}