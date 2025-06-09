class Doctor {
  final String uid;
  final String name;

  Doctor({required this.uid, required this.name});

  factory Doctor.fromMap(Map<String, dynamic> data, String uid) {
    return Doctor(
      uid: uid,
      name: data['name'] ?? '',
    );
  }
}
