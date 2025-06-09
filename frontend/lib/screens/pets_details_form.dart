import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/buttom_nav.dart';

class PetsDetailsForm extends StatefulWidget {
  final String doctor_name;
  final String doctor_uid;
  final String date;
  final String time;
  final String user_name;
  final String email;
  final String phone;

  const PetsDetailsForm({
    super.key,
    required this.doctor_name,
    required this.doctor_uid,
    required this.date,
    required this.time,
    required this.user_name,
    required this.email,
    required this.phone,
  });

  @override
  State<PetsDetailsForm> createState() => _PetsDetailsFormState();
}

class _PetsDetailsFormState extends State<PetsDetailsForm> {
  int _selected_index = 1;

  final TextEditingController pet_name_controller = TextEditingController();
  final TextEditingController pet_image_url_controller = TextEditingController();

  void _on_item_tapped(int index) {
    setState(() {
      _selected_index = index;
    });
  }

  Future<void> _submit_appointment() async {
    final String pet_name = pet_name_controller.text.trim();
    final String pet_image_url = pet_image_url_controller.text.trim();

    if (pet_name.isEmpty || pet_image_url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    try {
      await FirebaseFirestore.instance.collection('appointments').add({
        'doctor': widget.doctor_name,
        'doctor_uid': widget.doctor_uid,
        'date': widget.date,
        'time': widget.time,
        'user_name': widget.user_name,
        'email': widget.email,
        'phone': widget.phone,
        'petName': pet_name,
        'image': pet_image_url,
        'timestamp': FieldValue.serverTimestamp(),
        'status': "upcoming",
      });

      await FirebaseFirestore.instance.collection('notifications').add({
        'user_uid': 'USER_PLACEHOLDER_123',
        'title': 'Appointment Reminder',
        'message':
        'You have an appointment with Dr. ${widget.doctor_name} on ${widget.date} at ${widget.time}.',
        'seen': false,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Appointment confirmed! Reminder set.')),
      );

      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  void dispose() {
    pet_name_controller.dispose();
    pet_image_url_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Book Appointment', style: TextStyle(fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Enter Your Pet Info",
                        style: TextStyle(fontSize: 18, color: Color(0xFFB4A9A9)),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text("Pet Name", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: pet_name_controller,
                      decoration: InputDecoration(
                        hintText: "e.g. Memo",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text("Pet Image URL", style: TextStyle(fontSize: 18)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: pet_image_url_controller,
                      decoration: InputDecoration(
                        hintText: "https://example.com/pet.jpg",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submit_appointment,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                child: const Text("Confirm and Submit", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selected_index,
        onItemTapped: _on_item_tapped,
      ),
    );
  }
}