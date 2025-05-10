import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/AppointmentCard.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat, size: 30),
            color: const Color(0xFF5E2A6F),
            onPressed: () {
            },
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
      body: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisExtent: 270,
        ),
        itemBuilder: (context, i) {
          return AppointmentCard(
            ownerName: i < 1 ? 'laith' : "gaith",
            petName: i < 1 ? 'cat' : "dog",
            petPhoto: 'https://petfriendstores.com/cdn/shop/articles/pexels-vadim-b-127027.jpg?v=1714707378&width=1100',
            date: '21 Mar 2025',
            time: '11-12 AM',

          );
        },
      ),
    );
  }
}
