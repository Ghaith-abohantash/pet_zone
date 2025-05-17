import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VeterinarianNotificationScreen extends StatefulWidget {
  const VeterinarianNotificationScreen({super.key});

  @override
  _VeterinarianNotificationScreenState createState() =>
      _VeterinarianNotificationScreenState();
}

class _VeterinarianNotificationScreenState
    extends State<VeterinarianNotificationScreen> {
  List<bool> _buttonStates = List.generate(6, (index) => false);

  void markAllAsRead() {
    setState(() {
      _buttonStates = List.generate(_buttonStates.length, (index) => true);
    });
    print("All buttons marked as read");
  }

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
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 4),
            Text(
              "Notification",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: markAllAsRead,
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
              ...List.generate(6, (index) {
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
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
