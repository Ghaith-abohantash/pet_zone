import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.ownerName,
    required this.petName,
    required this.petPhoto,
    required this.date,
    required this.time,
  });

  final String? ownerName;
  final String? petName;
  final String? petPhoto;
  final String? date;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 20),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.primaryColor, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                    width: 80,
                    child: petPhoto != null && petPhoto!.isNotEmpty
                        ? Image.network(petPhoto!, fit: BoxFit.cover)
                        : const Icon(Icons.pets, size: 80, color: Colors.grey),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ownerName != null && ownerName!.isNotEmpty ? ownerName! : "No Owner Name",
                        style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold) ??
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        petName != null && petName!.isNotEmpty ? petName! : "No Pet Name",
                        style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey) ??
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Icon(Icons.date_range, color: theme.primaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Date',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ) ??
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF5E2A6F)),
                  ),
                  const Spacer(),
                  Text(
                    date != null && date!.isNotEmpty ? date! : "N/A",
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.timelapse, color: theme.primaryColor),
                  const SizedBox(width: 10),
                  Text(
                    'Time',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.primaryColor,
                    ) ??
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF5E2A6F)),
                  ),
                  const Spacer(),
                  Text(
                    time != null && time!.isNotEmpty ? time! : "N/A",
                    style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold) ??
                        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
