import 'package:flutter/material.dart';

import 'CustomText.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldLable,
    this.keyBoardType,
    this.validateMessege,
    this.hintText,
    this.isObscure,
    this.suffixIcon,
    this.fontWeight,
  });

  final String fieldLable;

  final FontWeight? fontWeight;

  final double lableSize = 16;

  final String? hintText;

  final TextInputType? keyBoardType;

  final String? validateMessege;

  final IconButton? suffixIcon;

  final bool? isObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            fontWeight: fontWeight,
            text: fieldLable,
            size: lableSize,
            color: const Color(0xff596992),
            textAlign: TextAlign.left),
        const SizedBox(height: 10),
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return validateMessege;
            }
            return null;
          },
          obscureText: isObscure ?? false,
          keyboardType: keyBoardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xffFEFEFE),
            hintText: hintText,
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xffFEFEFE),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xffFEFEFE),
                width: 3,
              ),
            ),
          ),
        )
      ],
    );
  }
}
