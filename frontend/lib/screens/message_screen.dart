
import 'package:flutter/material.dart';
import '../routes/routes.dart';
class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Button 1
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFEFEFEF), // background #EFEFEF
                elevation: 0, // no shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(color: Colors.grey.shade400), // natural border
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.chatPage);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/doctor_profile.png', width: 65, height: 65),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Dr.Noor Kusa", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "Good Bye,Thank You!",
                            style: TextStyle(fontSize: 14, color: Color(0xFF9CABC2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("10:30", style: TextStyle(fontSize: 12, color: Color(0xFF9CABC2))),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFEFEFEF), // background #EFEFEF
                elevation: 0, // no shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(color: Colors.grey.shade400), // natural border
                ),
              ),
              onPressed: () {
                print("Button is clickable");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/girl.png', width: 65, height: 65),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Dr.Bayan Abdalhq", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "Good Bye,Thank You!",
                            style: TextStyle(fontSize: 14, color: Color(0xFF9CABC2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("1d", style: TextStyle(fontSize: 12, color: Color(0xFF9CABC2))),
                ],
              ),
            ),

            const SizedBox(height: 18),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFEFEFEF), // background #EFEFEF
                elevation: 0, // no shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(color: Colors.grey.shade400), // natural border
                ),
              ),
              onPressed: () {
                print("Button is clickable");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/wesam.png', width: 65, height: 65),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Dr.Wesam Ali", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "Good Bye,Thank You!",
                            style: TextStyle(fontSize: 14, color: Color(0xFF9CABC2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("2d", style: TextStyle(fontSize: 12, color: Color(0xFF9CABC2))),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFEFEFEF), // background #EFEFEF
                elevation: 0, // no shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(color: Colors.grey.shade400), // natural border
                ),
              ),
              onPressed: () {
                print("Button is clickable");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/david.png', width: 65, height: 65),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Dr.David Clove", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "Good Bye,Thank You!",
                            style: TextStyle(fontSize: 14, color: Color(0xFF9CABC2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("2d", style: TextStyle(fontSize: 12, color: Color(0xFF9CABC2))),
                ],
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                foregroundColor: Colors.black,
                backgroundColor: const Color(0xFFEFEFEF), // background #EFEFEF
                elevation: 0, // no shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                  side: BorderSide(color: Colors.grey.shade400), // natural border
                ),
              ),
              onPressed: () {
                print("Button is clickable");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/mary.png', width: 65, height: 65),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Dr.Mary Santo", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            "Good Bye,Thank You!",
                            style: TextStyle(fontSize: 14, color: Color(0xFF9CABC2)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text("3 Mar", style: TextStyle(fontSize: 12, color: Color(0xFF9CABC2))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
