import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants/colors.dart';
import '../widgets/button_with_icon.dart';

class OtherLoginMethods extends StatelessWidget {
  const OtherLoginMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CustomButtonWithIcon(
            onPressed: () {
              // Handle button press
            },
            backgroundColor: const Color(0xFF1877F2),
            icon: FontAwesomeIcons.facebookF,
            iconColor: AppColors.lightTextColor,
            label: 'Continue with Facebook',
            labelColor: AppColors.lightTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CustomButtonWithIcon(
            onPressed: () {
              // Handle button press
            },
            backgroundColor: AppColors.darkBackgroundColor,
            icon: FontAwesomeIcons.apple,
            iconColor: AppColors.lightTextColor,
            label: 'Continue with Apple',
            labelColor: AppColors.lightTextColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: CustomButtonWithIcon(
            onPressed: () {
              // Handle button press
            },
            backgroundColor: const Color(0xFFD4D4D8),
            icon: FontAwesomeIcons.google,
            iconColor: AppColors.darkTextColor,
            label: 'Continue with Google',
            labelColor: AppColors.darkTextColor,
          ),
        ),
      ],
    );
  }
}
