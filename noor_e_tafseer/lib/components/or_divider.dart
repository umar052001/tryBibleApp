import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            left: 20.0,
            right: 12.0,
            bottom: 5.0,
          ),
          child: Container(
            width: 147,
            height: 1,
            color: const Color(0xFFD4D4D8),
          ),
        ),
        const Text(
          "or",
          style: TextStyle(
            color: Color(0xFF71717A),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
            left: 12.0,
            right: 12.0,
            bottom: 5.0,
          ),
          child: Container(
            width: 147,
            height: 1,
            color: const Color(0xFFD4D4D8),
          ),
        ),
      ],
    );
  }
}
