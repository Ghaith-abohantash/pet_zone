import 'package:flutter/material.dart';
import '../models/user_notification_model.dart';

class UserNotificationProvider with ChangeNotifier {
  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: "Reminder 1",
      description: "Your appointment is soon",
      iconPath: 'assets/images/reminder_icon.png',
    ),
    NotificationItem(
      title: "Reminder 2",
      description: "Don’t forget your vet visit",
      iconPath: 'assets/images/reminder_icon.png',
    ),

  ];

  List<NotificationItem> get notifications => _notifications;

  void markAsRead(int index) {
    _notifications[index].isRead = true;
    notifyListeners();
  }

  void markAllAsRead() {
    for (var notif in _notifications) {
      notif.isRead = true;
    }
    notifyListeners();
  }
}
