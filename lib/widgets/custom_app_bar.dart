import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      padding: const EdgeInsets.only(
        top: 70,
        bottom: 20,
      ),
      decoration: const BoxDecoration(
        color: Color(0xffFEFEFE),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: SvgPicture.asset(
        "assets/images/glovy_logo.svg",
        width: 150,
        height: 150,
      ),
    );
  }
}
