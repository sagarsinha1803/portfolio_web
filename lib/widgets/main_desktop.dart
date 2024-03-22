import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class MainDesktopView extends StatelessWidget {
  const MainDesktopView({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(
        minHeight: 350.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi,\nI'm Sagar Sinha\nA Fullstack Developer",
                style: TextStyle(
                  fontSize: 30.0,
                  height: 1.5,
                  wordSpacing: 3.5,
                  fontWeight: FontWeight.bold,
                  color: CustomColor.whitePrimary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Get in touch"),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/geeky_monkey.png",
            width: screenWidth / 2.5,
          )
        ],
      ),
    );
  }
}
