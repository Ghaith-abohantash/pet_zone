import 'package:flutter/material.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF5E2A6F)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/empty.png',
              width: 120,
              height: 120,
              color: Color(0xFF5E2A6F),
            ),
            const SizedBox(height: 24),
            const Text(
              'Your Cart is Empty',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 250,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/pets');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5E2A6F),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Explore Pets',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
