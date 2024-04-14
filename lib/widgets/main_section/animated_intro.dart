import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    // TextStyle typeWriterTextStyle = TextStyle(
    //   color: CustomColor.whitePrimary,
    //   fontSize: fontsSize + 10,
    //   height: fontsHeight,
    //   wordSpacing: wordsSpacing,
    //   fontFamily: fontFamily,
    // );
    TextStyle typeWriterTextStyle = GoogleFonts.walterTurncoat(
      color: CustomColor.whitePrimary,
      fontSize: fontsSize + 7,
      height: fontsHeight,
      wordSpacing: wordsSpacing,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTextStyle(
          style: TextStyle(
            fontSize: fontsSize,
            color: CustomColor.whitePrimary,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Hello World!',
                  textStyle: GoogleFonts.patrickHandSc(
                    fontSize: fontsSize + 10,
                  ),
                  speed: const Duration(milliseconds: 200)),
            ],
            pause: const Duration(milliseconds: 1000),
            repeatForever: true,
            isRepeatingAnimation: true,
            onTap: () {},
          ),
        ),
        Row(
          children: [
            Text(
              "I'm ",
              style: GoogleFonts.rockSalt(
                fontSize: fontsSize - 5,
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
                    speed: const Duration(milliseconds: 250),
                    textStyle: GoogleFonts.sedgwickAveDisplay(
                      fontSize: fontsSize + 30,
                      // fontFamily: fontFamily,
                    ),
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
                onTap: () {},
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
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
