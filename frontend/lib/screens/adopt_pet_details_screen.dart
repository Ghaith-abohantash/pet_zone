import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/adopt_pet_provider.dart';
import '../widgets/buttom_nav.dart'; // Your existing bottom nav widget

class AdoptPetDetailsScreen extends StatefulWidget {
  final String adoptPetId;
  const AdoptPetDetailsScreen({super.key, required this.adoptPetId});

  @override
  State<AdoptPetDetailsScreen> createState() => _AdoptPetDetailsScreenState();
}

class _AdoptPetDetailsScreenState extends State<AdoptPetDetailsScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<AdoptPetProvider>(context).getById(widget.adoptPetId);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Adopt Pet Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 315,
                width: 354,
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  pet.imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("Age", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Text(
                        "${pet.age} years",
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Sex", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Text(
                        pet.sex,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Breed", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Text(
                        pet.breed,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "The ${pet.breed} is a loving and loyal companion, perfect for adoption.",
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Add adoption action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    "Adopt Now",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
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
