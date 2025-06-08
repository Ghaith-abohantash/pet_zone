import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../viewmodels/notification_view_model.dart';
import '../models/notification_model.dart';
import '../widgets/notification_Card.dart';

class VeterinarianNotificationScreen extends StatefulWidget {
  const VeterinarianNotificationScreen({super.key});

  @override
  _VeterinarianNotificationScreenState createState() =>
      _VeterinarianNotificationScreenState();
}

class _VeterinarianNotificationScreenState extends State<VeterinarianNotificationScreen> {
  final String doctorId = "doctor_test_id";
  final NotificationViewModel viewModel = NotificationViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(width: 4),
            Text(
              "Notifications",
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<NotificationModel>>(
        stream: viewModel.getNotificationsStream(doctorId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading notifications."));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final notifications = snapshot.data!;
          if (notifications.isEmpty) {
            return const Center(child: Text("No notifications found."));
          }
          return Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8),
                  child: TextButton(
                    onPressed: () async {
                      await viewModel.markAllAsRead(notifications);
                      setState(() {});
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
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notif = notifications[index];
                    return NotificationCard(
                      notification: notif,
                      onTap: () async {
                        await viewModel.markNotificationAsSeen(notif.id);
                        setState(() {});
                      },
                    );
                  },
                ),
              ),

            ],
          );
        },
      ),
    );
  }
}
