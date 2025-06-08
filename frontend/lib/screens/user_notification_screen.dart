import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_notification_provider.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttom_nav.dart';

class UserNotificationPage extends StatelessWidget {
  const UserNotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notificationProvider = Provider.of<UserNotificationProvider>(context);
    final notifications = notificationProvider.notifications;

    return Scaffold(
      appBar: const CustomAppBar(title: "Notification"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  notificationProvider.markAllAsRead();
                },
                child: const Text(
                  "Make as seen",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF7A7A7A),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final notification = notifications[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: notification.isRead
                            ? Colors.white
                            : const Color(0xFFEFEFEF),
                        foregroundColor: Colors.black,
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                          side: const BorderSide(color: Color(0xFFA7C210)),
                        ),
                      ),
                      onPressed: () {
                        notificationProvider.markAsRead(index);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            notification.iconPath,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.title,
                                style: const TextStyle(fontSize: 18),
                              ),
                              Text(
                                notification.description,
                                style: const TextStyle(fontSize: 16, color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: 3,
        onItemTapped: (index) {},
      ),
    );
  }
}
