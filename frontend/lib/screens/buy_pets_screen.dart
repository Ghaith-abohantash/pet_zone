import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/buttom_nav.dart';

class BuyPets extends StatefulWidget {
  const BuyPets({super.key});

  @override
  State<BuyPets> createState() => _BuyPetsState();
}

class _BuyPetsState extends State<BuyPets> {
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
      backgroundColor: const Color(0XFFFFFFFF),
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left:24,right:24,bottom:24),
        child: Column(
          children: [
            ToggleButtons(
              isSelected: _toggleSelected,
              onPressed: _onTogglePressed,
              borderRadius: BorderRadius.circular(9),
              selectedColor: Colors.white,
              fillColor: Color(0xFF5E2A6F),
              borderColor: Color(0xFFA7C210),
              selectedBorderColor: Color(0xFFA7C210),
              borderWidth: 1.5,
              constraints: BoxConstraints(minWidth: 176.5, minHeight: 32), // 353 / 2 = 176.5
              children: const [
                Text(
                  "Sale",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "Adoption",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _currentToggleIndex == 0
                ? Expanded(child:ListView(
              children: [
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
                    SizedBox(width: 50),
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
                SizedBox(height: 34),
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
                    SizedBox(width: 50),
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
                SizedBox(height: 34),
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
                    SizedBox(width: 50),
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
                SizedBox(height: 34),
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
                    SizedBox(width: 50),
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
            )
            ) : Expanded(child:ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:160,
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

                      ],
                    ),
                    SizedBox(width: 50),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:160,
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

                      ],
                    ),
                    SizedBox(width: 50),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:160,
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

                      ],
                    ),
                    SizedBox(width: 50),
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
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 34),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width:160,
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

                      ],
                    ),
                    SizedBox(width: 50),
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
                      ],
                    ),
                  ],
                ),
              ],
            )
            )

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
