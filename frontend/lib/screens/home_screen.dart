import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/buttom_nav.dart';
import '../routes/routes.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: const CustomAppBar(title: "Pet Zone"),
      body: Container(
        margin: EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Advice For You !", style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(
              "To maintain your pet's health and happiness, ensure a balanced diet, regular veterinary visits, and routine hygiene. Set aside time for play and exercise, and provide love and attention to help them feel safe and comfortable. ❤️🐾",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                // Navigator.pushReplacementNamed(context, AppRoutes.bookappointemt);
              },
              child: Image.asset("assets/images/home-image.png"),
            ),
            SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Sales",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5E2A6F),
                  ),
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, AppRoutes.buyPets);
                      },
                      icon: Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF7A7A7A),
                        ),
                      ),
                      label: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xFF7A7A7A),
                      ),
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 160,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/mizo22.png",
                            height: 122,
                            width: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Masmosa Cat",
                                style: TextStyle(fontSize: 15),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("favorite icon clicked");
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF5E2A6F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                      ),
                      child: Text(
                        "\$2000",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/persiancat.png",
                            height: 122,
                            width: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Persian Cat",
                                style: TextStyle(fontSize: 15),
                              ),
                              IconButton(
                                onPressed: () {
                                  print("favorite icon clicked");
                                },
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Color(0xFF5E2A6F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        "\$1200",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
