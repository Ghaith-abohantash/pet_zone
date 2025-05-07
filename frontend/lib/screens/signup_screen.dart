import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? selectedRole;
  final List<String> roles = ['Pet Owner', 'Veterinarian'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 40),
              Text("Name", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text("Email", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  hintText: "name@example.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text("Password", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Container(
                height: 54,
                width: 370,
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "**********",
                    suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text("Join as", style: TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Container(
                width: 370,
                child: DropdownButtonFormField<String>(
                  value: selectedRole,
                  hint: Text("Select a role"),
                  items: roles.map((String role) {
                    return DropdownMenuItem<String>(
                      value: role,
                      child: Text(role),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRole = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      print("Sign Up button is work");

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5E2A6F),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account? ", style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        print("Login is work");
                      },
                      child: Text(
                        "Login?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
