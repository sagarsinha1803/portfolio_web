import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/contact_section.dart';
import 'package:portfolio_web/widgets/footer_section.dart';
import 'package:portfolio_web/widgets/header_bar.dart';
import 'package:portfolio_web/widgets/header_bar_mobile.dart';
import 'package:portfolio_web/widgets/main_desktop.dart';
import 'package:portfolio_web/widgets/main_mobile.dart';
import 'package:portfolio_web/widgets/mobile_view_drawer.dart';
import 'package:portfolio_web/widgets/project_section.dart';
import 'package:portfolio_web/widgets/skill_destop.dart';
import 'package:portfolio_web/widgets/skill_mobile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= minDesktopWindowWidth
            ? null
            : const MobileViewDrawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            if (constraints.maxWidth >= minDesktopWindowWidth)
              const HeaderBar()
            else
              HeaderMobile(
                onLogoTap: () {},
                onMenuTap: () {
                  scaffoldKey.currentState?.openEndDrawer();
                },
              ),

            if (constraints.maxWidth >= minDesktopWindowWidthImage)
              MainDesktopView(
                screenWidth: screenSize.width,
                screenHeight: screenSize.height,
              )
            else
              MainMobileView(
                screenWidth: screenSize.width,
                screenHeight: screenSize.height,
              ),
            //Skills
            Container(
              width: screenSize.width,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Title
                  const Text(
                    "What I can do",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.whitePrimary,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Platform and skill
                  if (constraints.maxWidth >= minSkillWindowWidth)
                    const SkillDesktopView()
                  else
                    const SkillMobileView()
                ],
              ),
            ),

            //Projects
            ProjectSection(
              screenWidth: screenSize.width,
            ),
            //Contact
            const ContactSection(),
            //Footer
            const SizedBox(
              height: 30,
            ),
            const Footer(),
          ],
        ),
      );
    });
  }
}
