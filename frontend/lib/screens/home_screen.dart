import 'package:flutter/material.dart';
import 'package:petzone_project/screens/personal_info_screen.dart';
import 'package:petzone_project/screens/user_notification_screen.dart';
import 'package:provider/provider.dart';
import '../providers/home_provider.dart';
import '../widgets/buttom_nav.dart';
import '../widgets/app_bar.dart'; // تأكد أنك تستورد ملف الـ CustomAppBar
import 'buy_pets_screen.dart';
import 'empty_appointment_view.dart';

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
    final homeProvider = Provider.of<HomeProvider>(context);
    final primaryColor = Theme.of(context).primaryColor;

    final List<Widget> pages = [
      SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Advice For You !",
              style: TextStyle(
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              homeProvider.isLoadingQuote
                  ? "Loading..."
                  : homeProvider.dailyQuote ?? "No quote",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                print("Tapped!");
              },
              child: Image.asset("assets/images/home-image.png"),
            ),
            const SizedBox(height: 19),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Top Sales",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    _onItemTapped(2);
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  label: Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                ),
              ],
            ),
            const SizedBox(height: 8),
            homeProvider.isLoadingTopSales
                ? const Center(child: CircularProgressIndicator())
                : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: homeProvider.topSalesPets
                  .map(
                    (pet) => _buildPetCard(
                  imagePath: pet.imageUrl,
                  title: pet.name,
                  price: pet.price != null
                      ? "\$${pet.price!.toStringAsFixed(2)}"
                      : "N/A",
                  primaryColor: primaryColor,
                ),
              )
                  .toList(),
            ),
          ],
        ),
      ),
      const EmptyAppointmentView(),
      const BuyPets(),
      const UserNotificationPage(),
      const PersonalInfoScreen(),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _selectedIndex == 0
          ? const CustomAppBar(title: "Pet Zone")  // استخدم الـ CustomAppBar هنا فقط في الهوم
          : null,
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNav(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }

  Widget _buildPetCard({
    required String imagePath,
    required String title,
    required String price,
    required Color primaryColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(imagePath, height: 122, width: 150, fit: BoxFit.cover),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      print("favorite icon clicked");
                    },
                    icon: Icon(
                      Icons.favorite_border,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            price,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
