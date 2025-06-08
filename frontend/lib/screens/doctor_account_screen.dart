import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../providers/doctor_provider.dart';

class DoctorAccountPage extends StatefulWidget {
  const DoctorAccountPage({super.key});

  @override
  State<DoctorAccountPage> createState() => _DoctorAccountPageState();
}

class _DoctorAccountPageState extends State<DoctorAccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? _imageFile;

  @override
  void initState() {
    super.initState();
    final doctor = Provider.of<DoctorProvider>(context, listen: false).doctor;

    nameController.text = doctor.name;
    emailController.text = doctor.email;
    phoneController.text = doctor.phoneNumber;
    addressController.text = doctor.clinicAddress;
    descriptionController.text = doctor.description;
    if (doctor.imagePath != null) {
      _imageFile = File(doctor.imagePath!);
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _imageFile = File(picked.path);
      });
    }
  }

  void saveData() {
    Provider.of<DoctorProvider>(context, listen: false).updateDoctor(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      clinicAddress: addressController.text,
      description: descriptionController.text,
      imagePath: _imageFile?.path,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Doctor info saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Doctor Account'),
        backgroundColor: const Color(0xFF5E2A6F),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: saveData,
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 100,
                      backgroundImage: _imageFile != null
                          ? FileImage(_imageFile!)
                          : const AssetImage('assets/images/doctor_profile.png')
                      as ImageProvider,
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: pickImage,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.add_photo_alternate,
                            size: 28,
                            color: Color(0xFF5E2A6F),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              _buildTextField("Name", nameController),
              const SizedBox(height: 16),
              _buildTextField("Email", emailController),
              const SizedBox(height: 16),
              _buildTextField("Phone number", phoneController),
              const SizedBox(height: 16),
              _buildTextField("Clinic Address", addressController),
              const SizedBox(height: 24),
              const Text("Description", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: TextField(
                  controller: descriptionController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: "Description about doctor",
                    suffixIcon: const Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 18)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            suffixIcon: const Icon(Icons.edit, color: Color(0xFF5E2A6F)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9),
            ),
          ),
        ),
      ],
    );
  }
}
