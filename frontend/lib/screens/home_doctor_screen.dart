import 'package:flutter/material.dart';
import '../routes/routes.dart';

class HomeDoctorScreen extends StatelessWidget {
  const HomeDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth > 600) ? 3 : 2;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: true,
        title: Text(
          'Doctor Dashboard',
          style: TextStyle(
            color: const Color(0xFF5E2A6F),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline, size: 26),
            color: const Color(0xFF5E2A6F),
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.messagePage);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back, Doctor!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5E2A6F),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your appointments and profile easily',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.1,
                children: [
                  _buildDashboardCard(
                    context,
                    icon: Icons.person_outline,
                    label: 'Profile',
                    routeName: AppRoutes.doctorProfilePage,
                    color: const Color(0xFFB388EB),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.calendar_today_outlined,
                    label: 'Appointments',
                    routeName: AppRoutes.appointmentScreen,
                    color: const Color(0xFF85C1E9),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.settings_outlined,
                    label: 'Account Settings',
                    routeName: AppRoutes.doctorAccountPage,
                    color: const Color(0xFFA3E4D7),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.pets_outlined,
                    label: 'Animal Shop',
                    routeName: AppRoutes.animalShopPage,
                    color: const Color(0xFFF8C471),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.notifications_none_outlined,
                    label: 'Notifications',
                    routeName: AppRoutes.doctornotification,
                    color: const Color(0xFFEC7063),
                  ),
                  _buildDashboardCard(
                    context,
                    icon: Icons.support_agent_outlined,
                    label: 'Support',
                    routeName: AppRoutes.doctornotification,
                    color: const Color(0xFF48C9B0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String routeName,
        required Color color,
      }) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, routeName),
      borderRadius: BorderRadius.circular(16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        shadowColor: color.withOpacity(0.4),
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.2),
                radius: 28,
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF5E2A6F),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
