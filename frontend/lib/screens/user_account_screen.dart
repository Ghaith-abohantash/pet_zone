import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';  // لو تستخدم Firebase Auth
import '../routes/routes.dart';
import '../widgets/app_bar.dart';

class UserAccountPage extends StatefulWidget {
  const UserAccountPage({super.key});

  @override
  State<UserAccountPage> createState() => _UserAccountPage();
}

class _UserAccountPage extends State<UserAccountPage> {
  int _selectedIndex = 4;

  List<bool> _toggleSelection = [true, false];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 4) {
      // ممكن تحط منطق هنا اذا حبيت
    }
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
              onPressed: () {
                Navigator.of(ctx).pop(); // إغلاق الحوار
              },
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
    // لو تستخدم Firebase Auth
    await FirebaseAuth.instance.signOut();

    // تحويل إلى صفحة تسجيل الدخول مع مسح الصفحة الحالية
    Navigator.pushReplacementNamed(context, AppRoutes.logIn);
  }

  @override
  Widget build(BuildContext context) {
    const fieldSpacing = 12.0;

    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: const CustomAppBar(title: "Account"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // قللت المسافة بين الاب بار والصورة (مثلاً 20 بدل 40)
                const SizedBox(height: 20),

                Center(
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.only(top: 20),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/doctor_profile.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Icon(
                            Icons.add_photo_alternate,
                            size: 24,
                            color: Color(0xFF5E2A6F),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const Text("Name", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Noor Kusa",
                    suffixIcon:
                    const Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),

                const SizedBox(height: fieldSpacing),

                const Text("Email", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "name@example.com",
                    suffixIcon:
                    const Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),

                const SizedBox(height: fieldSpacing),

                const Text("Phone number", style: TextStyle(fontSize: 18)),
                const SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: "05988XXXXX",
                    suffixIcon:
                    const Icon(Icons.edit, color: Color(0xFF5E2A6F)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    icon: const Icon(Icons.logout, color: Color(0xFF5E2A6F)),
                    label: const Text(
                      "Logout",
                      style: TextStyle(color: Color(0xFF5E2A6F)),
                    ),
                    onPressed: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ),


                if (_selectedIndex == 4)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Center(
                      child: ToggleButtons(
                        borderRadius: BorderRadius.circular(8),
                        selectedColor: Colors.white,
                        fillColor: const Color(0xFF5E2A6F),
                        color: const Color(0xFF5E2A6F),
                        constraints: const BoxConstraints(
                          minWidth: 162,
                          minHeight: 73,
                        ),
                        isSelected: _toggleSelection,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _toggleSelection.length; i++) {
                              _toggleSelection[i] = i == index;
                            }
                          });
                          if (index == 0) {
                            Navigator.pushReplacementNamed(
                                context, AppRoutes.userAccountPage);
                          } else {
                            Navigator.pushNamed(context, AppRoutes.favorite);
                          }
                        },
                        children: const [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.account_circle),
                              SizedBox(width: 8),
                              Text("Account"),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(width: 8),
                              Text("Favorite"),
                            ],
                          ),
                        ],
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
