import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class AnimalShopViewModel extends ChangeNotifier {
  List<PetModel> _pets = [];
  bool _isLoading = true;
  int _currentToggleIndex = 0;

  List<PetModel> get pets => _pets;
  bool get isLoading => _isLoading;
  int get currentToggleIndex => _currentToggleIndex;

  AnimalShopViewModel() {
    fetchPets();
  }

  Future<void> fetchPets() async {
    try {
      _isLoading = true;
      notifyListeners();

      final snapshot = await FirebaseFirestore.instance
          .collection('pets')
          .orderBy('createdAt', descending: true)
          .get();

      _pets = snapshot.docs
          .map((doc) => PetModel.fromMap(doc.data(), doc.id))
          .toList();

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
    }
  }

  List<PetModel> getFilteredPets() {
    String selectedStatus = _currentToggleIndex == 0 ? 'For Sale' : 'For Adopt';
    return _pets.where((pet) => pet.status == selectedStatus).toList();
  }

  void setToggleIndex(int index) {
    _currentToggleIndex = index;
    notifyListeners();
  }
}
