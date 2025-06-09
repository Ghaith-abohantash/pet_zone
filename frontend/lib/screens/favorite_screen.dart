import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/favorite_model.dart';
import '../providers/favorite_provider.dart';
import '../routes/routes.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttom_nav.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 4;

  int _currentToggleIndex = 1;
  List<bool> _toggleSelection = [false, true];

  int _saleOrAdoptIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget buildFavoriteItem(PetModel pet, {bool showPrice = true}) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(pet.imageAsset, height: 122, width: 150, fit: BoxFit.cover),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(pet.name, style: const TextStyle(fontSize: 15)),
              IconButton(
                onPressed: () {
                  print("favorite icon clicked for ${pet.name}");
                },
                icon: const Icon(Icons.favorite, color: Color(0xFF5E2A6F)),
              ),
            ],
          ),
          if (showPrice && pet.price != null)
            Text('\$${pet.price}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get real data from provider
    final List<PetModel> favoriteItems = _saleOrAdoptIndex == 0
        ? Provider.of<FavoriteProvider>(context).saleFavorites
        : Provider.of<FavoriteProvider>(context).adoptionFavorites;

    // Show price only if Sale is selected
    bool showPrice = _saleOrAdoptIndex == 0;

    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: const CustomAppBar(title: "Favorite"),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // New toggle at the top: Sale / Adopt
              Center(
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.white,
                  fillColor: const Color(0xFF5E2A6F),
                  color: const Color(0xFF5E2A6F),
                  constraints: const BoxConstraints(minWidth: 180, minHeight: 40),
                  isSelected: [_saleOrAdoptIndex == 0, _saleOrAdoptIndex == 1],
                  onPressed: (int index) {
                    setState(() {
                      _saleOrAdoptIndex = index;
                    });
                  },
                  children: const [
                    Text("Sale", style: TextStyle(fontSize: 16)),
                    Text("Adopt", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (favoriteItems.length / 2).ceil(),
                itemBuilder: (context, index) {
                  int first = index * 2;
                  int second = first + 1;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildFavoriteItem(favoriteItems[first], showPrice: showPrice),
                      if (second < favoriteItems.length)
                        buildFavoriteItem(favoriteItems[second], showPrice: showPrice)
                      else
                        const SizedBox(width: 160),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              if (_selectedIndex == 4)
                Center(
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(8),
                    selectedColor: Colors.white,
                    color: const Color(0xFF5E2A6F),
                    constraints: const BoxConstraints(minWidth: 162, minHeight: 73),
                    isSelected: _toggleSelection,
                    onPressed: (int index) {
                      setState(() {
                        for (int i = 0; i < _toggleSelection.length; i++) {
                          _toggleSelection[i] = i == index;
                        }
                        _currentToggleIndex = index;
                      });

                      if (index == 0) {
                        Navigator.pushReplacementNamed(context, AppRoutes.userAccountPage);
                      } else {
                        Navigator.pushReplacementNamed(context, AppRoutes.favorite);
                      }
                    },
                    fillColor: Colors.transparent,
                    renderBorder: false,
                    children: List.generate(2, (index) {
                      bool isSelected = _toggleSelection[index];
                      Color backgroundColor = isSelected ? const Color(0xFF5E2A6F) : Colors.transparent;
                      Color iconAndTextColor = isSelected ? Colors.white : const Color(0xFF5E2A6F);

                      return Container(
                        width: 162,
                        height: 73,
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                index == 0 ? Icons.account_circle : Icons.favorite,
                                color: iconAndTextColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                index == 0 ? "Account" : "Favorite",
                                style: TextStyle(color: iconAndTextColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
            ],
          ),
        ),
      ),

    );
  }
}
