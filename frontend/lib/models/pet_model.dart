class PetModel {
  final String id;
  final String name;
  final String imageUrl;
  final String status;
  final double? price;
  final int? age;
  final String? gender;
  final String? weight;

  PetModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.status,
    this.price,
    this.age,
    this.gender,
    this.weight,
  });

  factory PetModel.fromMap(Map<String, dynamic> data, String documentId) {
    return PetModel(
        id: documentId,
        name: data['name'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
        status: data['status'] ?? '',
        price: data['price'] != null ? double.tryParse(data['price'].toString()) : null,
        age: data['age'] != null ? int.tryParse(data['age'].toString()) : null,
        gender: data['gender'],
      weight: data['weight'] ,
       );
    }
}