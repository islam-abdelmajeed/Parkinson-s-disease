import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graduation_project/widget/CustomText.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SvgPicture.asset("assets/images/support.svg"),
            const SizedBox(height: 30),
            const Center(
              child: Text(
                "Are you facing any problem?",
                style: TextStyle(
                  color: Color(0xff5E6D92),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Center(
              child: Text(
                "if you need instart support you can contact at",
                style: TextStyle(
                  color: Color(0xff8E95A7),
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                color: Color(0xffFEFEFE),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80),
                  bottomLeft: Radius.circular(80),
                ),
              ),
              child: const Center(
                child: Text(
                  "glovyteam1@gmail.com",
                  style: TextStyle(
                    color: Color(0xff5E6D92),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 120,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "May be have already the solution",
                    style: TextStyle(
                      color: Color(0xff5E6D92),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset("assets/icons/smile_face_ic.svg"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
