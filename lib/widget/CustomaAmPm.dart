import 'package:flutter/cupertino.dart';

import '../globalData.dart';
import '../main.dart';

class CustomAmPm extends StatefulWidget {
  const CustomAmPm({super.key});

  @override
  State<CustomAmPm> createState() => _CustomAmPmState();
}

class _CustomAmPmState extends State<CustomAmPm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 140,
      decoration: BoxDecoration(
        color: const Color(0xffD8E6FB),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  timeFormat = "AM";
                });
              },
              child: Text(
                "AM",
                style: TextStyle(
                  color: timeFormat == "AM"
                      ? const Color(0xff58B0CD)
                      : const Color(0xff596992),
                  fontSize: 24,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  timeFormat = "PM";
                });
              },
              child: Text(
                "PM",
                style: TextStyle(
                  color: timeFormat == "PM"
                      ? const Color(0xff58B0CD)
                      : const Color(0xff596992),
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
