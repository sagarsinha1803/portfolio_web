import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/styles/style.dart';
import 'package:portfolio_web/widgets/animated_intro.dart';

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
              const AnimatedIntro(
                fontsSize: 30.0,
                fontsHeight: 1.5,
                wordsSpacing: 3.5,
                fontFamily: 'Horizon',
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {},
                  style: elevatedButtonStyle,
                  child: const Text(
                    "Get in touch",
                    style: elevatedButtonTextStyle,
                  ),
                ),
              ),
            ],
          ),
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.whitePrimary.withOpacity(0.9),
                CustomColor.whiteSecondary.withOpacity(1),
                CustomColor.yellowPrimary.withOpacity(0.8),
              ]).createShader(bounds);
            },
            child: Image.asset(
              "assets/geeky_monkey.png",
              width: screenWidth / 3,
            ),
          )
        ],
      ),
    );
  }
}
