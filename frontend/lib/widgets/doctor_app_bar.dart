import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const DoctorAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFFFFF),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
        onPressed: () {print("back button is work");},
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            print("message icon is work");
          },
          icon: SvgPicture.asset(
            'assets/images/ant-design_message-filled.svg',
          ),
        ),
        const SizedBox(width: 8),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
