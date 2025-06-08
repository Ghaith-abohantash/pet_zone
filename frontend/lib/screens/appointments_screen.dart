import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/AppointmentCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<Map<String, dynamic>> appointments = [];

  @override
  void initState() {
    super.initState();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    final snapshot = await FirebaseFirestore.instance.collection('appointments').get();

    final data = snapshot.docs.map((doc) => doc.data()).toList();

    setState(() {
      appointments = List<Map<String, dynamic>>.from(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat, size: 30),
            color: const Color(0xFF5E2A6F),
            onPressed: () {},
          ),
        ],
        title: Text(
          "Appointments",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Color(0xFF5E2A6F),
          ),
        ),
      ),
      body: appointments.isEmpty
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        itemCount: appointments.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: 270,
        ),
        itemBuilder: (context, i) {
          final appt = appointments[i];
          return AppointmentCard(
            ownerName: appt['ownerName'] ?? '',
            petName: appt['petName'] ?? '',
            petPhoto: appt['petPhoto'] ?? '',
            date: appt['date'] ?? '',
            time: appt['time'] ?? '',
          );
        },
      ),
    );
  }
}