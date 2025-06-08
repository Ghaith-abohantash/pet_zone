import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<List<NotificationModel>> getNotificationsStream(String doctorId) {
    return _firestore
        .collection('notifications')
        .where('doctorId', isEqualTo: doctorId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => NotificationModel.fromDoc(doc))
        .toList());
  }

  Future<void> markNotificationAsSeen(String notificationId) async {
    await _firestore
        .collection('notifications')
        .doc(notificationId)
        .update({'seen': true});
  }

  Future<void> markAllAsRead(List<NotificationModel> notifications) async {
    final batch = _firestore.batch();
    for (var notif in notifications) {
      batch.update(
          _firestore.collection('notifications').doc(notif.id),
          {'seen': true});
    }
    await batch.commit();
    }
}