import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../routes/routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFFFFFFFF),
      actions: [
        IconButton(
          onPressed: () {
            print("Tapped!");
            Navigator.pushNamed(context, AppRoutes.cart);
          },
          icon: SvgPicture.asset(
            'assets/images/icon-park-solid_shopping.svg',
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.messagePage);
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
