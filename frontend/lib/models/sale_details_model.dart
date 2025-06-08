class SalePet {
  final String id;
  final String name;
  final String breed;
  final int age;
  final double price;
  final String sex; // Added sex
  final String imageAsset;

  SalePet({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.price,
    required this.sex, // Constructor param
    required this.imageAsset,
  });
}
