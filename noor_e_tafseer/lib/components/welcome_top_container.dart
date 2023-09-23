import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TopContainer extends StatelessWidget {
  final String text1;
  final String text2;

  const TopContainer({
    super.key,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      color: AppColors.darkBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0, bottom: 30),
        child: Column(
          children: [
            Text(
              text1,
              style: const TextStyle(
                color: Color(0xFFE4E4E7),
                fontFamily: 'SF Pro Display',
                fontSize: 18.0,
              ),
            ),
            Text(
              text2,
              style: const TextStyle(
                color: Color(0xFFE4E4E7),
                fontFamily: 'SF Pro Display',
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
