import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class AddAnimalScreen extends StatefulWidget {
  const AddAnimalScreen({super.key});

  @override
  State<AddAnimalScreen> createState() => _AddAnimalScreen();
}

class _AddAnimalScreen extends State<AddAnimalScreen> {
  int _selectedIndex = 1;
  String _selectedGender = 'Male';
  String _selectedStatus = 'For Sale';
  File? _selectedImage;

  final ImagePicker _picker = ImagePicker();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Add New Animal',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24,bottom: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Pet Name", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "Memo",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text("Price", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "1000",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text("Pet Age", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "3",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text("Pet Weight", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "3Kg",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),

              const SizedBox(height: 16),
              const Text("Pet Sex", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        activeColor: const Color(0xFF5E2A6F),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      const Text('Male'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        activeColor: const Color(0xFF5E2A6F),
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),
              const Text("Image", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _selectedImage == null
                            ? "Upload Image"
                            : "Image Selected",
                        style: TextStyle(
                          color: _selectedImage == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      const Icon(Icons.image_outlined, color: Colors.black54),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Pet Status", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'For Sale',
                        groupValue: _selectedStatus,
                        activeColor: const Color(0xFF5E2A6F),
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value!;
                          });
                        },
                      ),
                      const Text('For Sale'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'For Adopt',
                        groupValue:_selectedStatus,
                        activeColor: const Color(0xFF5E2A6F),
                        onChanged: (value) {
                          setState(() {
                            _selectedStatus = value!;
                          });
                        },
                      ),
                      const Text('For Adopt'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text("Description", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 24),
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    print("Add new pet is work");
                    print("Selected gender: $_selectedGender");
                    print("Selected image: ${_selectedImage?.path}");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  child: const Text(
                    "Add New Pet",
                    style: TextStyle(fontSize: 18, color: Colors.white),
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
