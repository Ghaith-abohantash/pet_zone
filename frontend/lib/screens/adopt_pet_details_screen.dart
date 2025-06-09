import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/adopt_pet_view_model.dart';
import '../widgets/buttom_nav.dart';

class AdoptPetDetailsScreen extends StatefulWidget {
  final String adoptPetId;
  const AdoptPetDetailsScreen({Key? key, required this.adoptPetId}) : super(key: key);

  @override
  State<AdoptPetDetailsScreen> createState() => _AdoptPetDetailsScreenState();
}

class _AdoptPetDetailsScreenState extends State<AdoptPetDetailsScreen> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    Provider.of<AdoptPetViewModel>(context, listen: false).fetchPetById(widget.adoptPetId);
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AdoptPetViewModel>(context);
    final pet = viewModel.pet;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Adopt Pet Details', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : pet == null
          ? const Center(child: Text("Pet not found."))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 315,
                width: 354,
                margin: const EdgeInsets.only(top: 20),
                child: Image.network(
                  pet.imageUrl,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "This adorable pet is looking for a loving home. Perfect for companionship!",
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
                    // Adoption action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text("Adopt Now", style: TextStyle(fontSize: 18, color: Colors.white)),
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