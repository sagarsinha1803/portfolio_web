import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

BoxDecoration navBoxdecorate = BoxDecoration(
  gradient: const LinearGradient(
    colors: [
      Colors.transparent,
      CustomColor.bgLight1,
    ],
  ),
  borderRadius: BorderRadius.circular(100),
);

ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: CustomColor.yellowPrimary,
);

const TextStyle elevatedButtonTextStyle = TextStyle(
  color: CustomColor.whitePrimary,
  fontWeight: FontWeight.w500,
  fontSize: 15,
);
