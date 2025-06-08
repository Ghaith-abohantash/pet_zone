import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../models/pet_model.dart';

class HomeViewModel {
  Future<String?> fetchDailyQuote() async {
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final doc = await FirebaseFirestore.instance
        .collection('dailyQuotes')
        .doc(today)
        .get();

    if (doc.exists) {
      return doc['text'] as String?;
    }
    return null;
  }

  Future<List<PetModel>> fetchTopSalesPets() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('pets')
        .where('status', isEqualTo: 'For Sale')
        .limit(2)
        .get();

    return snapshot.docs
        .map((doc) => PetModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
