import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/profile_data.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/contact_section.dart';
import 'package:portfolio_web/widgets/footer_section.dart';
import 'package:portfolio_web/widgets/header_bar.dart';
import 'package:portfolio_web/widgets/header_bar_mobile.dart';
import 'package:portfolio_web/widgets/main_desktop.dart';
import 'package:portfolio_web/widgets/main_mobile.dart';
import 'package:portfolio_web/widgets/mobile_view_drawer.dart';
import 'package:portfolio_web/widgets/project_tabview.dart';
import 'package:portfolio_web/widgets/skill_destop.dart';
import 'package:portfolio_web/widgets/skill_mobile.dart';
import 'dart:js' as js;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarkeys = List.generate(4, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth >= minDesktopWindowWidth
            ? null
            : MobileViewDrawer(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                key: navBarkeys.first,
              ),
              if (constraints.maxWidth >= minDesktopWindowWidth)
                HeaderBar(
                  onNavItemTap: (int navIndex) {
                    scrollToSection(navIndex);
                  },
                )
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
                key: navBarkeys[1],
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
              // ProjectSection(
              //   key: navBarkeys[2],
              //   screenWidth: screenSize.width,
              // ),
              // if (constraints.maxWidth >= minSkillWindowWidth)
              //   ProjectTabView(
              //     key: navBarkeys[2],
              //     screenHeight: screenSize.height,
              //     screenWidth: screenSize.width / 3,
              //   )
              // else
              // ProjectTabView(
              //   key: navBarkeys[2],
              //   screenHeight: screenSize.height,
              //   screenWidth: screenSize.width * 3,
              // ),
              SizedBox(
                  height: screenSize.height / 1.4,
                  child: ProjectTabView(
                    key: navBarkeys[2],
                    constrainMaxWidth: constraints.maxWidth,
                    screenHeight: screenSize.height,
                    screenWidth: screenSize.width * 3,
                  )),
              //Contact
              ContactSection(
                key: navBarkeys[3],
              ),
              //Footer
              const SizedBox(
                height: 30,
              ),
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a page
      js.context.callMethod("open", [ProfileLinks.blog]);
    }
    final key = navBarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 1000,
      ),
      curve: Curves.easeInOut,
    );
  }
}
