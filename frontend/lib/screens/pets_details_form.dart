
import 'package:flutter/material.dart';

import '../widgets/buttom_nav.dart';

class PetsDetailsForm extends StatefulWidget {
  const PetsDetailsForm({super.key});

  @override
  State<PetsDetailsForm> createState() => _PetsDetailsForm();

}
class _PetsDetailsForm extends State<PetsDetailsForm> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Book Appointment',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body:

      Padding(

        padding: const EdgeInsets.only(left :24,right:24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text("Enter Your Pet Details",style: TextStyle(fontSize: 18,color: Color(0xFFB4A9A9)),)),
            const SizedBox(height: 24),
            Text("Pet Name", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Memo",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Pet Type", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "Cat",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Pet Age", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "3",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Pet Weight(optionl)", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                hintText: "3",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Additonal Notes", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              width: double.infinity,
              child: TextField(
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),

    );
  }
}
