import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/buttom_nav.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<bool> _buttonStates = List.generate(6, (index) => false);

  void markAllAsRead() {
    setState(() {
      _buttonStates = List.generate(_buttonStates.length, (index) => true);
    });
    print("All buttons marked as read");
  }
  int _selectedIndex = 3;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Notification",),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(6, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    backgroundColor: _buttonStates[index]
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
                    setState(() {
                      _buttonStates[index] = true;
                    });
                    print("Notification button ${index + 1} is work");
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/reminder_icon.png',
                        width: 60,
                        height: 60,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Reminder ${index + 1}",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const Text(
                            "Your appointment is soon ",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),    );

  }
}

// //
// appBar: AppBar(
// automaticallyImplyLeading: false,
// actions: [
// TextButton(
// onPressed: markAllAsRead,
// child: const Text(
// "Mark All As Red",
// style: TextStyle(color: Color(0xFF7A7A7A)),
// ),
// ),
// ],
// ),
