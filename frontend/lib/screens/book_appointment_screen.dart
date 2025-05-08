import 'package:flutter/material.dart';
import 'empty_appointment_view.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Book Appointment'),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Color(0xFF5E2A6F),
            unselectedLabelColor: Colors.black,
            indicatorColor: Color(0xFF5E2A6F),
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
              Tab(text: 'Cancelled'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            EmptyAppointmentView(),
            EmptyAppointmentView(),
            EmptyAppointmentView(),
          ],
        ),
      ),
    );
  }
}
