import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/appointment_view_model.dart';
import '../models/appointment_model.dart';
import '../widgets/AppointmentCard.dart';
import '../providers/auth_provider.dart'; // تأكد من استيراده

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final viewModel = AppointmentViewModel(authProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.chat, size: 30),
            color: theme.primaryColor,
            onPressed: () {},
          ),
        ],
        title: Text(
          "Appointments",
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: StreamBuilder<List<Appointment>>(
        stream: viewModel.getAppointmentsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Appointments Found."));
          }

          final appointments = snapshot.data!;

          return GridView.builder(
            itemCount: appointments.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisExtent: 270,
            ),
            itemBuilder: (context, i) {
              final appointment = appointments[i];
              return AppointmentCard(
                ownerName: appointment.ownerName,
                petName: appointment.petName,
                petPhoto: appointment.petPhoto,
                date: appointment.date,
                time: appointment.time,
              );
            },
          );
        },
      ),
    );
  }
}