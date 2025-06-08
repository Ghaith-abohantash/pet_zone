import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/doctor_provider.dart';
import '../widgets/doctor_app_bar.dart';

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
      const SnackBar(content: Text('Saved & synced to Firestore')),
    );
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
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
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
                        Icons.edit,
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
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Clinic Address',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,  // fixed width
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
                    style: TextStyle(fontSize: 18 ,color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
