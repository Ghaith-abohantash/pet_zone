import 'package:flutter/material.dart';
import '../models/adopt_pet_model.dart';

class AdoptPetProvider with ChangeNotifier {
  final List<AdoptPet> _adoptPets = [
    AdoptPet(
      id: '1',
      name: 'Luna',
      breed: 'Beagle',
      age: 3,
      sex: 'Female',
      imageAsset: 'assets/images/adopt_details.png',
    ),
    AdoptPet(
      id: '2',
      name: 'Charlie',
      breed: 'Bulldog',
      age: 4,
      sex: 'Male',
      imageAsset: 'assets/images/adopt_details.png',
    ),
  ];

  List<AdoptPet> get adoptPets => _adoptPets;

  AdoptPet getById(String id) {
    return _adoptPets.firstWhere((pet) => pet.id == id);
  }
}