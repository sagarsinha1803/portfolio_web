import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/header_section/header_bar.dart';
import 'package:portfolio_web/widgets/header_section/header_bar_mobile.dart';

class HeaderSection extends StatelessWidget {
  final double constrainScreenMaxWidth;
  final Function(int) scrollToSectionFn;
  final VoidCallback? onMenuTap;

  const HeaderSection({
    super.key,
    required this.constrainScreenMaxWidth,
    required this.scrollToSectionFn,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return constrainScreenMaxWidth >= headerSectionSize['desktop']!
        ? HeaderBar(
            onNavItemTap: (int navIndex) {
              scrollToSectionFn(navIndex);
            },
          )
        : HeaderMobile(
            onLogoTap: () {},
            onMenuTap: onMenuTap,
          );
  }
}


              //  if (constraints.maxWidth >= minDesktopWindowWidth)
              //     HeaderBar(
              //       onNavItemTap: (int navIndex) {
              //         scrollToSection(navIndex);
              //       },
              //     )
              //   else
              //     HeaderMobile(
              //       onLogoTap: () {},
              //       onMenuTap: () {
              //         scaffoldKey.currentState?.openEndDrawer();
              //       },
              //     ),