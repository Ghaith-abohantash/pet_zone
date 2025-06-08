class Appointment {
  final String ownerName;
  final String petName;
  final String petPhoto;
  final String date;
  final String time;

  Appointment({
    required this.ownerName,
    required this.petName,
    required this.petPhoto,
    required this.date,
    required this.time,
  });

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      ownerName: map['ownerName'] ?? '',
      petName: map['petName'] ?? '',
      petPhoto: map['petPhoto'] ?? '',
      date: map['date'] ?? '',
      time: map['time'] ?? '',
    );
  }
}
