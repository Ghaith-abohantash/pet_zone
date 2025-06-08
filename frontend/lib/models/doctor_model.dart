class Doctor {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String clinicAddress;
  final String description;
  final String? imagePath;

  Doctor({
    required this.id,
    this.name = '',
    this.email = '',
    this.phoneNumber = '',
    this.clinicAddress = '',
    this.description = '',
    this.imagePath,
  });

  Doctor copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? clinicAddress,
    String? description,
    String? imagePath,
  }) {
    return Doctor(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      clinicAddress: clinicAddress ?? this.clinicAddress,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'email': email,
    'phoneNumber': phoneNumber,
    'clinicAddress': clinicAddress,
    'description': description,
    'imagePath': imagePath,
  };

  factory Doctor.fromMap(String id, Map<String, dynamic> data) {
    return Doctor(
      id: id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      clinicAddress: data['clinicAddress'] ?? '',
      description: data['description'] ?? '',
      imagePath: data['imagePath'],
    );
  }
}
