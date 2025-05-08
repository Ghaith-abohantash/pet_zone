import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key,  required this.ownerName, required this.petName, required this.petPhoto, required this.date, required this.time});
  final String ownerName;
  final String petName;
  final String petPhoto;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31, vertical: 20),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Color(0xFF5E2A6F), width: 2),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.network(petPhoto),
                    height: 80,
                    width: 100,
                  ),
                  SizedBox(width: 20),
                  Column(
                    children: [
                      Text(
                        ownerName,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        petName,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Icon(
                    Icons.date_range,
                    color: Color(0xFF5E2A6F),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'date',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5E2A6F),
                    ),
                  ),
                  Spacer(),
                  Text(
                    date,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.timelapse,
                    color: Color(0xFF5E2A6F),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'time',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5E2A6F),
                    ),
                  ),
                  Spacer(),
                  Text(
                    time,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
