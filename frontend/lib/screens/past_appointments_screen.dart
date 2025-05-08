import 'package:flutter/material.dart';

class PastAppointmentsScreen extends StatelessWidget {
  const PastAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAppointmentCard(
          doctorName: 'Dr.Mohammad Ali',
          petName: 'Sassy',
          date: '3 Mar 2025',
          time: '11–12 AM',
          imagePath: 'assets/images/dog.png',
        ),
        const SizedBox(height: 16),
        _buildAppointmentCard(
          doctorName: 'Dr.Mohammad Ali',
          petName: 'Rozi',
          date: '3 Mar 2025',
          time: '11–12 AM',
          imagePath: 'assets/images/cat.png',
        ),
      ],
    );
  }

  Widget _buildAppointmentCard({
    required String doctorName,
    required String petName,
    required String date,
    required String time,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lime, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(imagePath, width: 60, height: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(doctorName, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(petName, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16, color: Colors.purple),
                    const SizedBox(width: 4),
                    Text(date),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16, color: Colors.purple),
                    const SizedBox(width: 4),
                    Text(time),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
