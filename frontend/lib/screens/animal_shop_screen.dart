import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../routes/routes.dart';
import '../widgets/doctor_app_bar.dart';
import '../viewmodels/animal_shop_viewmodel.dart';
import '../providers/animal_shop_provider.dart';

class AnimalShopScreen extends StatelessWidget {
  const AnimalShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimalShopProvider(
      child: Scaffold(
        appBar: const DoctorAppBar(title: "Animal Shop"),
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
          child: Consumer<AnimalShopViewModel>(
            builder: (context, viewModel, child) {
              return Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.addAnimalPage);
                      },
                      child: const Text("Add New Pet"),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ToggleButtons(
                    isSelected: [
                      viewModel.currentToggleIndex == 0,
                      viewModel.currentToggleIndex == 1
                    ],
                    onPressed: viewModel.setToggleIndex,
                    borderRadius: BorderRadius.circular(9),
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    borderColor: const Color(0xFFA7C210),
                    selectedBorderColor: const Color(0xFFA7C210),
                    borderWidth: 1.5,
                    constraints: const BoxConstraints(minWidth: 170, minHeight: 32),
                    children: const [
                      Text("Sale"),
                      Text("Adoption"),
                    ],
                  ),
                  const SizedBox(height: 24),
                  viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: ListView(
                      children: [
                        Wrap(
                          spacing: 25,
                          runSpacing: 34,
                          children: viewModel.getFilteredPets().map((pet) {
                            return SizedBox(
                              width: 156,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    pet.imageUrl,
                                    height: 122,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          pet.name,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (pet.status == 'For Sale' && pet.price != null)
                                    Text("\$${pet.price!.toStringAsFixed(0)}"),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
