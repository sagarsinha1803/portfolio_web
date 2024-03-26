import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class AnimatedIntro extends StatelessWidget {
  final double fontsSize;
  final double fontsHeight;
  final double wordsSpacing;
  final String fontFamily;

  const AnimatedIntro({
    super.key,
    required this.fontsSize,
    required this.fontsHeight,
    required this.wordsSpacing,
    required this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle typeWriterTextStyle = TextStyle(
      color: CustomColor.whitePrimary,
      fontSize: fontsSize + 10,
      height: fontsHeight,
      wordSpacing: wordsSpacing,
      fontFamily: fontFamily,
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
            pause: const Duration(milliseconds: 1000),
            repeatForever: true,
            isRepeatingAnimation: true,
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
              "I am ",
              style: TextStyle(
                fontSize: fontsSize,
                height: fontsHeight,
                color: CustomColor.whitePrimary,
                fontFamily: fontFamily,
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
                    speed: const Duration(milliseconds: 250),
                    textStyle: TextStyle(
                      fontSize: fontsSize + 20,
                      fontFamily: fontFamily,
                    ),
                    colors: colorizeColors,
                  ),
                ],
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
            fontFamily: fontFamily,
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
