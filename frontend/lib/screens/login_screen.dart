import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(top: 95),
              child: Image.asset(
                'assets/images/log_in_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 28),
          Center(
            child: Text(
              "Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Email", style: TextStyle(fontSize: 18)),
            ),
          ),

          Center(
            child: Container(
              height: 54,
              width: 350,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text("Password", style: TextStyle(fontSize: 18)),
            ),
          ),
          SizedBox(height: 4),

          Center(
            child: Container(
              height: 54,
              width: 350,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "**********",
                  suffixIcon: IconButton(
                    onPressed: () {
                      print("Eye icon clicked");
                    },
                    icon: Icon(Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ),
          SizedBox(height: 1),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    print("Forget Password is work");
                  },
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          Center(
            child: Container(
              width: 350,
              height: 50,
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  print("Login button is work");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5E2A6F),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
                child: Text(
                  "Login",
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
                Text("Don't have an email? ", style: TextStyle(fontSize: 16)),
                TextButton(
                  onPressed: () {
                    print("Sign Up is work");
                  },
                  child: Text(
                    "Sign Up?",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
