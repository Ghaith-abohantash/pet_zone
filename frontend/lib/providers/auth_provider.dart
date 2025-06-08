/*import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '/models/user_model.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  AppUser? _user;

  AppUser? get user => _user;

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user!.uid;

      // Use UserRoles from the model file
      String roleToSave = (role == UserRoles.petOwner) ? UserRoles.petOwner : UserRoles.veterinarian;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'role': roleToSave,
      });

      _user = AppUser(uid: uid, name: name, email: email, role: roleToSave);
      notifyListeners();
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<User?> loginWithEmail(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = result.user!.uid;

      final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        _user = AppUser(
          uid: uid,
          name: doc['name'],
          email: doc['email'],
          role: doc['role'],
        );
      }

      notifyListeners();
      return result.user;
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<String?> getUserRole(String uid) async {
    if (_user != null && _user!.uid == uid) {
      return _user!.role;
    }

    final doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    if (doc.exists) {
      return doc['role'];
    }

    return null;
   }
}*/