import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.textColor,
      this.backgroundColor,
      required this.childText,
      this.containerWidth,
      this.fontSize,
      required this.onPressed});
  final Color textColor;

  final Color? backgroundColor;

  final String childText;

  final double? fontSize;

  final double? containerWidth;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(11)),
      child: MaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            childText,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
