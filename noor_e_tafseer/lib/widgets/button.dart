import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        fixedSize: const Size(398.0, 60.0),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'SF Pro Display',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w700,
          fontSize: 18.0,
          color: AppColors.darkTextColor,
        ),
      ),
    );
  }
}
