import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final emailController = TextEditingController();

  String? successMessage;
  String? errorMessage;
  final formKey = GlobalKey<FormState>();

  bool _isValidEmail(String input) {
    return input.contains('@') && input.contains('.');
  }

  String? validateEmail(String? value) {
    final input = value?.trim() ?? '';
    if (input.isEmpty) {
      return 'This field is required.';
    } else if (!_isValidEmail(input)) {
      return 'Enter a valid email.';
    }
    return null;
  }

  Future<void> submit() async {
    successMessage = null;
    errorMessage = null;
    notifyListeners();

    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      try {
        await _auth.sendPasswordResetEmail(email: email);
        successMessage =
        'A password reset link has been sent to your email:\n$email';
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found with this email.';
        } else {
          errorMessage = e.message ?? 'An error occurred';
        }
      } catch (_) {
        errorMessage = 'An unexpected error occurred.';
      }

      notifyListeners();
    }
  }

  void disposeControllers() {
    emailController.dispose();
  }
}
