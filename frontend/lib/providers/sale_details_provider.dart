import 'package:flutter/material.dart';
import '../models/sale_details_model.dart';

class SalePetProvider with ChangeNotifier {
  final List<SalePet> _salePets = [
    SalePet(
      id: '1',
      name: 'Bella',
      breed: 'Golden Retriever',
      age: 2,
      price: 750.0,
      sex: 'Female',
      imageAsset: 'assets/images/sale_details.png',
    ),
    SalePet(
      id: '2',
      name: 'Max',
      breed: 'German Shepherd',
      age: 3,
      price: 820.0,
      sex: 'Male',
      imageAsset: 'assets/images/sale_details.png',
    ),
  ];

  List<SalePet> get salePets => _salePets;

  SalePet getById(String id) {
    return _salePets.firstWhere((pet) => pet.id == id);
  }
}