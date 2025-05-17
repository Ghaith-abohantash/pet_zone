import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes/routes.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String code = '';
  bool hasError = false;

  void _verifyCode() {
    if (code.length < 4) {
      setState(() {
        hasError = true;
      });
    } else {
      setState(() {
        hasError = false;
      });
      Navigator.pushNamed(context, AppRoutes.resetpasswordscreen);
    }
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Verification',
                  style: GoogleFonts.poppins(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Text(
                  'Please enter the code below to reset your password',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              PinCodeTextField(
                length: 4,
                appContext: context,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 60,
                  activeColor: Color(0xFF5E2A6F),
                  selectedColor: Color(0xFF5E2A6F),
                  inactiveColor: hasError ? Colors.red : Colors.grey,
                ),
                onChanged: (value) {
                  setState(() {
                    code = value;
                  });
                },
              ),
              if (hasError)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    "Please enter the 4-digit code.",
                    style: GoogleFonts.poppins(
                      color: Colors.red,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _verifyCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5E2A6F),
                    shape: RoundedRectangleBorder(),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Verify',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive a code? ",
                      style: GoogleFonts.poppins(
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                      },
                      child: Text(
                        "Resend",
                        style: GoogleFonts.poppins(
                          color: Color(0xFF5E2A6F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
