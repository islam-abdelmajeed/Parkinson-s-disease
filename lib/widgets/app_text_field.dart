import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.labelStyle,
    this.keyboardType,
    this.obscureText,
    this.readOnly,
    this.valueStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.isFilled,
    this.fillColor,
    this.contentPadding,
    this.suffixIcon,
    required this.validator,
    // this.onChanged,
  });

  final TextEditingController controller;
  final String label;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final bool? readOnly;
  final TextStyle? valueStyle;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final bool? isFilled;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final Widget? suffixIcon;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: labelStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xff596992),
              ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: obscureText ?? false,
          readOnly: readOnly ?? false,
          validator: validator,
          style: valueStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xff000000),
              ),
          decoration: InputDecoration(
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xff58B0CD),
                  ),
                ),
            errorBorder: enabledBorder ??
                OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                  ),
                ),
            filled: isFilled ?? true,
            fillColor: fillColor ?? const Color(0xffFFFFFF),
            contentPadding: contentPadding ?? const EdgeInsets.all(16),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(14.0),
              child: suffixIcon,
            ),
          ),
        ),
      ],
    );
  }
}
