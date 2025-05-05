import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Text(
          'Pet Zone',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      actions: [
        IconButton(
          onPressed: () {
            print("shopping icon clicked");
          },
          icon: SvgPicture.asset(
            'assets/images/icon-park-solid_shopping.svg',
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {
            print("message icon clicked");
          },
          icon: SvgPicture.asset(
            'assets/images/ant-design_message-filled.svg',
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
