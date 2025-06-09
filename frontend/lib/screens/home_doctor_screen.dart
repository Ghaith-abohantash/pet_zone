import 'package:flutter/material.dart';
import '../routes/routes.dart';
import '../widgets/home_doctor_items.dart';

class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth > 600) ? 3 : 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pet Zone',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, size: 30),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.doctornotification);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat, size: 30),
            color: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.messagePage);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.doctorProfilePage);
              },
              child: const HomeDoctorItems(
                imagePath: 'assets/images/Profile.png',
                label: 'Profile',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.appointmentScreen);
              },
              child: const HomeDoctorItems(
                imagePath: 'assets/images/Appointment.png',
                label: 'Appointment',
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.doctorAccountPage);
              },
              child: const HomeDoctorItems(
                imagePath: 'assets/images/Settings.png',
                label: 'Settings',
              ),
            ),
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.animalShopPage);
        },
           child :  const HomeDoctorItems(
              imagePath: 'assets/images/AnimalShop.png',
              label: 'Animal Shop',
            ),
      ) ],
       ),
      ),
    );
  }
}
