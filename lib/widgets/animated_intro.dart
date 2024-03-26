import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class AnimatedIntro extends StatelessWidget {
  final double fontsSize;
  final double fontsHeight;
  final double wordsSpacing;

  const AnimatedIntro({
    super.key,
    required this.fontsSize,
    required this.fontsHeight,
    required this.wordsSpacing,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle typeWriterTextStyle = TextStyle(
      color: CustomColor.whitePrimary,
      fontSize: fontsSize + 10,
      height: fontsHeight,
      wordSpacing: wordsSpacing,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          style: TextStyle(
            fontSize: fontsSize + 5,
            color: CustomColor.whitePrimary,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Hello World!',
                  speed: const Duration(milliseconds: 200)),
            ],
            isRepeatingAnimation: false,
            onTap: () {
              print(
                "Tap Event",
              );
            },
          ),
        ),
        Row(
          children: [
            Text(
              'I am ',
              style: TextStyle(
                fontSize: fontsSize,
                height: fontsHeight,
                color: CustomColor.whitePrimary,
              ),
            ),
            DefaultTextStyle(
              style: TextStyle(
                fontSize: fontsSize,
                color: CustomColor.whitePrimary,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Sagar Sinha',
                    speed: const Duration(milliseconds: 1000),
                    textStyle: TextStyle(
                      fontSize: fontsSize + 20,
                      fontFamily: 'Horizon',
                    ),
                    colors: colorizeColors,
                  ),
                ],
                pause: const Duration(milliseconds: 3000),
                isRepeatingAnimation: true,
                repeatForever: true,
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: fontsSize,
            color: CustomColor.whitePrimary,
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Flutter Developer',
                textStyle: typeWriterTextStyle,
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'Python Developer',
                textStyle: typeWriterTextStyle,
                speed: const Duration(milliseconds: 100),
              ),
              TypewriterAnimatedText(
                'JAVA Developer',
                textStyle: typeWriterTextStyle,
                speed: const Duration(milliseconds: 100),
              ),
            ],
            // pause: const Duration(milliseconds: 500),
            isRepeatingAnimation: true,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ],
    );
  }
}
