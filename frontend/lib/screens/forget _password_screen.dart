import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/routes.dart';


class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.verificationscreen);
    }
  }


  bool _isValidEmail(String input) {
    return input.contains('@') && input.contains('.');
  }

  bool _isValidPhone(String input) {
    return RegExp(r'^[0-9]{10,}$').hasMatch(input);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/forget_password.png',
                    height: 300,
                  ),
                ),
                const SizedBox(height: 13),
                Center(
                  child: Text(
                    'Forget Password',
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Please enter your phone or email address to send verification code',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey[600],
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _controller,
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    hintText: 'Enter your phone or email',
                    hintStyle: GoogleFonts.poppins(),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) {
                    final input = value?.trim() ?? '';
                    if (input.isEmpty) {
                      return 'This field is required.';
                    } else if (!_isValidEmail(input) && !_isValidPhone(input)) {
                      return 'Enter a valid phone number or email.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5E2A6F),
                      shape: RoundedRectangleBorder(),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Send Code',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


