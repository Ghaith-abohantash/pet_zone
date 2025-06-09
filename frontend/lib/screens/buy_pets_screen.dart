import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/pet_model.dart';
import '../providers/favorite_provider.dart';
import '../widgets/app_bar.dart';

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

  Future<List<PetModel>> getPetsByStatus(String status) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('pets')
          .where('status', isEqualTo: status)
          .get();

      return querySnapshot.docs.map((doc) => PetModel.fromMap(doc.data(), doc.id)).toList();
    } catch (e) {
      print('Error fetching pets: \$e');
      return [];
    }
  }

  Widget _buildPetCard(PetModel pet) {
    final provider = Provider.of<FavoriteProvider>(context);
    final isFavorite = provider.isFavorite(pet.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          pet.status == 'For Sale' ? '/saleDetails' : '/adoptDetails',
          arguments: pet.id,
        );
      },
      child: Container(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pet.imageUrl.isNotEmpty
                ? Image.network(
              pet.imageUrl,
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
                    pet.name,
                    style: const TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () => provider.toggleFavorite(pet),
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Color(0xFF5E2A6F),
                  ),
                ),
              ],
            ),
            if (pet.status == "For Sale" && pet.price != null)
              Text(
                "\$${pet.price!.toStringAsFixed(0)}",
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
          ],
        ),
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
                Text("Sale", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                Text("Adoption", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: FutureBuilder<List<PetModel>>(
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
                      final second = (index * 2 + 1 < pets.length) ? pets[index * 2 + 1] : null;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildPetCard(first),
                            if (second != null) _buildPetCard(second) else const SizedBox(width: 160),
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
