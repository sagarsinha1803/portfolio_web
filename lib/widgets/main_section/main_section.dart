import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/main_section/main_desktop.dart';
import 'package:portfolio_web/widgets/main_section/main_mobile.dart';

class MainSection extends StatelessWidget {
  final double constrainScreenMaxWidth;
  final double screenWidth;
  final double screenHeight;
  const MainSection({
    super.key,
    required this.constrainScreenMaxWidth,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return constrainScreenMaxWidth >= mainSectionSize['desktop']!
        ? MainDesktopView(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          )
        : MainMobileView(
            screenWidth: screenWidth,
            screenHeight: screenHeight,
          );
  }
}

                // if (constraints.maxWidth >= minDesktopWindowWidthImage)
                //   MainDesktopView(
                //     screenWidth: screenSize.width,
                //     screenHeight: screenSize.height,
                //   )
                // else
                  // MainMobileView(
                  //   screenWidth: screenSize.width,
                  //   screenHeight: screenSize.height,
                  // ),