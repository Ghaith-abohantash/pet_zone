import 'package:flutter/material.dart';

import '../routes/routes.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({super.key});

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _fullNameController = TextEditingController();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  void _submitPayment() {
    final fullName = _fullNameController.text.trim();
    final cardNumber = _cardNumberController.text.trim().replaceAll(' ', '');
    final expiryDate = _expiryDateController.text.trim();
    final cvv = _cvvController.text.trim();

    if (fullName.isEmpty || cardNumber.isEmpty || expiryDate.isEmpty || cvv.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    if (!RegExp(r'^\d{16}$').hasMatch(cardNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Card number must be 16 digits")),
      );
      return;
    }

    if (!RegExp(r'^(0[1-9]|1[0-2])\/\d{2}$').hasMatch(expiryDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Expiry date must be in MM/YY format")),
      );
      return;
    }

    if (!RegExp(r'^\d{3,4}$').hasMatch(cvv)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("CVV must be 3 or 4 digits")),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Success"),
        content: const Text("Payment processed successfully."),
        actions: [
          TextButton(
            onPressed: () =>  Navigator.pushNamed(context, AppRoutes.petZoneHome),
            child: const Text("OK"),
          )
        ],
      ),
    );

    _fullNameController.clear();
    _cardNumberController.clear();
    _expiryDateController.clear();
    _cvvController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: _fullNameController,
            decoration: const InputDecoration(
              labelText: 'Full Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 50),
          TextField(
            controller: _cardNumberController,
            decoration: const InputDecoration(
              labelText: 'Card Number',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expiryDateController,
                  decoration: const InputDecoration(
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextField(
                  controller: _cvvController,
                  decoration: const InputDecoration(
                    labelText: 'CVV',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _submitPayment,
              child: const Text('Pay Now'),
            ),
          ),
        ],
      ),
    );
  }
}
