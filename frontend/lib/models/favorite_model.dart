class PetModel {
  final String name;
  final String imageAsset;
  final int? price;
  final bool isForAdoption;

  PetModel({
    required this.name,
    required this.imageAsset,
    this.price,
    required this.isForAdoption,
  });
}
