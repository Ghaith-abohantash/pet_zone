import 'package:flutter/material.dart';
import '../models/pet_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<PetModel> _favorites = [];

  List<PetModel> get favorites => _favorites;

  void toggleFavorite(PetModel pet) {
    final index = _favorites.indexWhere((element) => element.id == pet.id);
    if (index >= 0) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(pet);
    }
    notifyListeners();
  }

  bool isFavorite(String petId) {
    return _favorites.any((pet) => pet.id == petId);
  }
}
