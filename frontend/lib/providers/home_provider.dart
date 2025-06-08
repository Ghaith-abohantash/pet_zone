import 'package:flutter/material.dart';
import '../models/pet_model.dart';
import '../viewmodels/home_view_model.dart';


class HomeProvider extends ChangeNotifier {
  final HomeViewModel _viewModel = HomeViewModel();

  String? _dailyQuote;
  String? get dailyQuote => _dailyQuote;

  bool _isLoadingQuote = false;
  bool get isLoadingQuote => _isLoadingQuote;

  List<PetModel> _topSalesPets = [];
  List<PetModel> get topSalesPets => _topSalesPets;

  bool _isLoadingTopSales = false;
  bool get isLoadingTopSales => _isLoadingTopSales;

  HomeProvider() {
    fetchDailyQuote();
    fetchTopSalesPets();
  }

  Future<void> fetchDailyQuote() async {
    _isLoadingQuote = true;
    notifyListeners();

    _dailyQuote = await _viewModel.fetchDailyQuote() ?? "No quote for today. 🐾";

    _isLoadingQuote = false;
    notifyListeners();
  }

  Future<void> fetchTopSalesPets() async {
    _isLoadingTopSales = true;
    notifyListeners();

    try {
      _topSalesPets = await _viewModel.fetchTopSalesPets();
    } catch (e) {
      print('Error fetching top sales: $e');
      _topSalesPets = [];
    }

    _isLoadingTopSales = false;
    notifyListeners();
  }
}
