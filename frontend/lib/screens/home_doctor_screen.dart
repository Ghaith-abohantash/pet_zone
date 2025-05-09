import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../routes/routes.dart';

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
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: const Color(0xFF5E2A6F),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
            color: const Color(0xFF5E2A6F),
            onPressed: () {
            },
          ),
          IconButton(
            icon: Icon(Icons.chat, size: 30),
            color: const Color(0xFF5E2A6F),
            onPressed: () {
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
            _buildGridItem('assets/images/Profile.png', 'Profile'),
            InkWell(child: _buildGridItem('assets/images/Appointment.png', 'Appointment'),onTap: (){Navigator.pushNamed(context, AppRoutes.veterinariannotificationscreen);},),
            _buildGridItem('assets/images/Settings.png', 'Settings'),
            _buildGridItem('assets/images/AnimalShop.png', 'Animal Shop'),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(String imagePath, String label) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Color(0xFF5E2A6F),
          ),
        ),
      ],
    );
  }
}
