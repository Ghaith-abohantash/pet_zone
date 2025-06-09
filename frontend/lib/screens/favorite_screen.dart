import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_provider.dart';
import '../models/pet_model.dart';
import '../widgets/app_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context);
    final favorites = provider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorites"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet!"))
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final pet = favorites[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  pet.status == 'For Sale' ? '/saleDetails' : '/adoptDetails',
                  arguments: pet.id,
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      pet.imageUrl,
                      height: 122,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, size: 122),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    pet.name,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (pet.status == "For Sale" && pet.price != null)
                    Text(
                      "\$${pet.price!.toStringAsFixed(0)}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => provider.toggleFavorite(pet),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
