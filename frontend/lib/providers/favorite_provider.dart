import 'package:flutter/material.dart';
import '../models/favorite_model.dart';

class FavoriteProvider with ChangeNotifier {
  final List<PetModel> _favorites = [
    PetModel(name: 'Masmosa Cat', imageAsset: 'assets/images/mizo22.png', price: 2000, isForAdoption: false),
    PetModel(name: 'Persian Cat', imageAsset: 'assets/images/persiancat.png', price: 2500, isForAdoption: false),
    PetModel(name: 'British Cat', imageAsset: 'assets/images/mizo22.png', price: 1800, isForAdoption: false),
    PetModel(name: 'Siamese Cat', imageAsset: 'assets/images/mizo22.png', isForAdoption: true),
    PetModel(name: 'Bengal Cat', imageAsset: 'assets/images/mizo22.png', isForAdoption: true),
    PetModel(name: 'Maine Coon', imageAsset: 'assets/images/mizo22.png', isForAdoption: true),
  ];

  List<PetModel> get saleFavorites => _favorites.where((pet) => !pet.isForAdoption).toList();
  List<PetModel> get adoptionFavorites => _favorites.where((pet) => pet.isForAdoption).toList();
}
