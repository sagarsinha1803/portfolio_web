import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class NavLogo extends StatelessWidget {
  const NavLogo({super.key, this.onTap});

  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'SS',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: CustomColor.yellowSecondary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
