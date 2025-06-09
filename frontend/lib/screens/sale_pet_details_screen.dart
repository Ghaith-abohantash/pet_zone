import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petzone_project/viewmodels/sale_details_view_model.dart';
import 'package:provider/provider.dart';
import 'cart_screen.dart';

class SalePetDetailsScreen extends StatefulWidget {
  final String petId;
  const SalePetDetailsScreen({super.key, required this.petId});

  @override
  State<SalePetDetailsScreen> createState() => _SalePetDetailsScreenState();
}

class _SalePetDetailsScreenState extends State<SalePetDetailsScreen> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<SaleDetailsViewModel>(context, listen: false);
    viewModel.fetchPetById(widget.petId);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SaleDetailsViewModel>(context);
    final pet = viewModel.pet;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pet Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/icon-park-solid_shopping.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              'assets/images/ant-design_message-filled.svg',
              width: 24,
              height: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
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
                  Text(
                    "\$${pet.price?.toStringAsFixed(2) ?? '0'}",
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
                        pet.age != null ? "${pet.age} years" : 'Unknown',
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
                        pet.gender != null && pet.gender!.isNotEmpty ? pet.gender! : 'Unknown',
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
                      const Text("Weight", style: TextStyle(fontSize: 15)),
                      const SizedBox(height: 8),
                      Text(
                        pet.weight != null && pet.weight!.isNotEmpty ? pet.weight! : 'Unknown',
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
                "The ${pet.name} is a friendly and intelligent animal, making it an ideal family pet.",
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
                    final price = pet.price?.toInt() ?? 0;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartScreen(
                          initialItems: [
                            {
                              'image': pet.imageUrl,
                              'name': pet.name,
                              'price': price,
                            }
                          ],
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
