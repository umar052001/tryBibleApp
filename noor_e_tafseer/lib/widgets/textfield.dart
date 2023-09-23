import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final bool autocorrect;
  final bool enableSuggestions;
  final TextInputType keyboardType;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.autocorrect,
    required this.enableSuggestions,
    required this.keyboardType,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      autocorrect: false,
      enableSuggestions: enableSuggestions,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.placeholderColor,
        ),
        contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFD4D4D8), width: 1.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      style: const TextStyle(
        fontFamily: 'SF Pro Display',
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 18.0,
        height: 1.0,
        color: AppColors.darkTextColor,
      ),
    );
  }
}
