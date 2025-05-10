import 'package:flutter/material.dart';
import '../widgets/buttom_nav.dart';

class SaleDetailsPage extends StatefulWidget {
  const SaleDetailsPage({super.key});

  @override
  State<SaleDetailsPage> createState() => _SaleDetailsPage();
}

class _SaleDetailsPage extends State<SaleDetailsPage> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<bool> _toggleSelected = [true, false];
  int _currentToggleIndex = 0;

  void _onTogglePressed(int index) {
    setState(() {
      for (int i = 0; i < _toggleSelected.length; i++) {
        _toggleSelected[i] = i == index;
      }
      _currentToggleIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Pet Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.message), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 315,
                width: 354,
                margin: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/sale_details.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Lucy",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Text(
                    "100\$",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Column(
                    children: [
                      Text("Age", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 8),
                      Text(
                        "1 years",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Sex", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 8),
                      Text(
                        "Male",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Weight", style: TextStyle(fontSize: 15)),
                      SizedBox(height: 8),
                      Text(
                        "3 kg",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5E2A6F),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "The British Shorthair is a breed version of the traditional British domestic cat, with a distinctively stocky build, thick coat and broad face. The most recognized color variant is British Blue, with a solid gray-blue coat, orange eyes, and a medium-sized tail..",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: Text(
                    "Buy Now",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

          ],
        ),
      ),
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
