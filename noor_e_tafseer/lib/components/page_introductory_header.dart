// This component will be basically return a column having an icon, title and description.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noor_e_tafseer/constants/colors.dart';

class PageIntroductoryHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const PageIntroductoryHeader({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 50.0,
          ),
          child: FaIcon(
            icon,
            size: 60,
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: AppColors.darkTextColor,
              fontFamily: 'SF Pro Display',
              fontSize: 30.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 30.0,
            right: 30.0,
            bottom: 20.0,
          ),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.darkTextColor,
              fontFamily: 'SF Pro Display',
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
