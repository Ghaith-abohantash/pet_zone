import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/animal_shop_viewmodel.dart';

class AnimalShopProvider extends StatelessWidget {
  final Widget child;

  const AnimalShopProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AnimalShopViewModel(),
      child: child,
    );
  }
}
