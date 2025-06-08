import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/pet_model.dart';

class PetService {
  final CollectionReference petsCollection = FirebaseFirestore.instance.collection('pets');

  Future<List<PetModel>> getPetsByStatus(String status) async {
    final querySnapshot = await petsCollection.where('status', isEqualTo: status).get();
    return querySnapshot.docs
        .map((doc) => PetModel.fromMap(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }
}
