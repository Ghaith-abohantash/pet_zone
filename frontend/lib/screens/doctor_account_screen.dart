import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../providers/doctor_provider.dart';
import '../widgets/doctor_app_bar.dart';
import '../routes/routes.dart';

class DoctorAccountPage extends StatefulWidget {
  const DoctorAccountPage({super.key});
  @override
  State<DoctorAccountPage> createState() => _DoctorAccountPageState();
}

class _DoctorAccountPageState extends State<DoctorAccountPage> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController descriptionController;

  File? _imageFile;

  @override
  void initState() {
    super.initState();
    final doctor = Provider.of<DoctorProvider>(context, listen: false).doctor;
    nameController = TextEditingController(text: doctor.name);
    emailController = TextEditingController(text: doctor.email);
    phoneController = TextEditingController(text: doctor.phoneNumber);
    addressController = TextEditingController(text: doctor.clinicAddress);
    descriptionController = TextEditingController(text: doctor.description);
    if (doctor.imagePath != null) {
      _imageFile = File(doctor.imagePath!);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    addressController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => _imageFile = File(picked.path));
    }
  }

  Future<void> saveData() async {
    await Provider.of<DoctorProvider>(context, listen: false).updateDoctor(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      clinicAddress: addressController.text,
      description: descriptionController.text,
      imagePath: _imageFile?.path,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved')),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text("Logout"),
          content: const Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                _logout(context);
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, AppRoutes.logIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Stack(
          children: [
            const DoctorAppBar(title: 'Doctor Account'),
            Positioned(
              right: 12,
              top: 8,
              child: IconButton(
                icon: const Icon(Icons.save, color: Color(0xFF5E2A6F)),
                onPressed: saveData,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            children: [
              GestureDetector(
                onTap: pickImage,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/images/doctor_profile.png')
                      as ImageProvider,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(
                        Icons.cloud_upload,
                        color: Color(0xFF5E2A6F),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Clinic Address',
                  suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  suffixIcon: Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: saveData,
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  icon: const Icon(Icons.logout, color: Color(0xFF5E2A6F)),
                  label: const Text(
                    "Logout",
                    style: TextStyle(color: Color(0xFF5E2A6F)),
                  ),
                  onPressed: () => _showLogoutDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
