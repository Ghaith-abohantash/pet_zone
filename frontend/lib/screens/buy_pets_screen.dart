import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/app_bar.dart'; // لو عندك CustomAppBar خاص

class BuyPets extends StatefulWidget {
  const BuyPets({super.key});

  @override
  State<BuyPets> createState() => _BuyPetsState();
}

class _BuyPetsState extends State<BuyPets> {
  List<bool> _toggleSelected = [true, false];
  int _currentToggleIndex = 0;

  void _onTogglePressed(int index) {
    setState(() {
      for (int i = 0; i < _toggleSelected.length; i++) {
        _toggleSelected[i] = i == index;
      }
      _currentToggleIndex = index;
    });
  }

  Future<List<Map<String, dynamic>>> getPetsByStatus(String status) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('status', isEqualTo: status)
          .get();

      return querySnapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e) {
      print('Error fetching pets: $e');
      return [];
    }
  }

  Widget _buildPetCard(Map<String, dynamic> pet) {
    return Container(
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pet['imageUrl'] != null && pet['imageUrl'].toString().isNotEmpty
              ? Image.network(
            pet['imageUrl'],
            height: 122,
            width: 150,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
            const Icon(Icons.broken_image, size: 122),
          )
              : Container(
            height: 122,
            width: 150,
            color: Colors.grey[300],
            child: const Icon(Icons.pets, size: 80, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  pet['name'] ?? "No Name",
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("favorite icon clicked");
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: Color(0xFF5E2A6F),
                ),
              ),
            ],
          ),
          if (pet['status'] == "For Sale")
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: Text(
                "\$${pet['price'] ?? '0'}",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String status = _currentToggleIndex == 0 ? 'For Sale' : 'For Adopt';

    return Scaffold(
      appBar: const CustomAppBar(title: "Pets Shop"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: _toggleSelected,
              onPressed: _onTogglePressed,
              borderRadius: BorderRadius.circular(9),
              selectedColor: Colors.white,
              fillColor: const Color(0xFF5E2A6F),
              borderColor: const Color(0xFFA7C210),
              selectedBorderColor: const Color(0xFFA7C210),
              borderWidth: 1.5,
              constraints: const BoxConstraints(minWidth: 170, minHeight: 32),
              children: const [
                Text("Sale",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                Text("Adoption",
                    style:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: getPetsByStatus(status),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No pets found"));
                  }

                  final pets = snapshot.data!;

                  return ListView.builder(
                    itemCount: (pets.length / 2).ceil(),
                    itemBuilder: (context, index) {
                      final first = pets[index * 2];
                      final second =
                      (index * 2 + 1 < pets.length) ? pets[index * 2 + 1] : null;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildPetCard(first),
                            if (second != null) _buildPetCard(second),
                            if (second == null) const SizedBox(width: 160),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
