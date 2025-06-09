import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/appointment_model.dart';
import '../providers/auth_provider.dart' as my_auth;

class AppointmentViewModels {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final my_auth.AuthProvider _authProvider;

  AppointmentViewModels(this._authProvider);

  Stream<List<Appointment>> getAppointmentsStream() {
    final doctorUid = _authProvider.user?.uid;

    if (doctorUid == null) {
      return Stream.value([]);
    }

    return _firestore
        .collection('appointments')
        .where('doctor_uid', isEqualTo: doctorUid)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Appointment.fromMap(doc.data() as Map<String, dynamic>))
        .toList());
    }
}