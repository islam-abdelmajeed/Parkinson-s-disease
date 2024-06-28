import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class AppRichText extends StatelessWidget {
  const AppRichText({
    super.key,
    required this.firstText,
    this.firstTextStyle,
    required this.secondText,
    this.secondTextStyle,
    required this.onTap,
  });

  final String firstText;
  final TextStyle? firstTextStyle;
  final String secondText;
  final TextStyle? secondTextStyle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: firstTextStyle ??
            const TextStyle(
              fontSize: 14,
              color: Color(0xff596992),
              fontWeight: FontWeight.normal,
            ),
        children: [
          TextSpan(
            text: secondText,
            style: secondTextStyle ??
                const TextStyle(
                  fontSize: 14,
                  color: Color(0xff58B0CD),
                  fontWeight: FontWeight.normal,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
