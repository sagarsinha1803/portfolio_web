import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/profile_data.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/contact_section/contact_section.dart';
import 'package:portfolio_web/widgets/footer_Section/footer_section.dart';
import 'package:portfolio_web/widgets/header_Section/header_Section.dart';
import 'package:portfolio_web/widgets/header_section/mobile_view_drawer.dart';
import 'package:portfolio_web/widgets/main_section/main_section.dart';
import 'package:portfolio_web/widgets/project_section/project_tabview.dart';
import 'package:portfolio_web/widgets/skill_section/skill_section.dart';
// import 'package:portfolio_web/widgets/skill_destop.dart';
// import 'package:portfolio_web/widgets/skill_mobile.dart';
import 'dart:js' as js;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navBarkeys = List.generate(4, (index) => GlobalKey());
  bool backToTop = false;
  @override
  void initState() {
    scrollController.addListener(() {
      setState(() {
        backToTop = scrollController.offset > 100 ? true : false;
      });
    });
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.forward();
  }

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
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back_2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  key: navBarkeys.first,
                ),
                HeaderSection(
                  constrainScreenMaxWidth: constraints.maxWidth,
                  scrollToSectionFn: scrollToSection,
                  onMenuTap: () => scaffoldKey.currentState?.openEndDrawer(),
                ),
                MainSection(
                  constrainScreenMaxWidth: constraints.maxWidth,
                  screenWidth: screenSize.width,
                  screenHeight: screenSize.height,
                ),
                SkillSection(
                  key: navBarkeys[1],
                  screenWidth: screenSize.width,
                  controller: _controller,
                ),
                SizedBox(
                  height: screenSize.height / 1.2,
                  child: ProjectTabView(
                    key: navBarkeys[2],
                    constrainMaxWidth: constraints.maxWidth,
                    screenHeight: screenSize.height,
                    screenWidth: screenSize.width * 3,
                  ),
                ),
                //Contact
                ContactSection(
                  key: navBarkeys[3],
                  screenWidth: screenSize.width,
                ),
                //Footer
                const SizedBox(
                  height: 30,
                ),
                const Footer(),
              ],
            ),
          ),
        ),
        floatingActionButton: backToTop
            ? FloatingActionButton(
                backgroundColor: CustomColor.yellowPrimary.withOpacity(0.7),
                onPressed: () {
                  scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Icon(Icons.arrow_upward),
              )
            : null,
      );
    });
  }

  void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a page
      js.context.callMethod("open", [ProfileLinks.blog]);
    }
    if (navIndex == 1) {
      // reload animation
      _controller.reset();
      _controller.forward();
    }
    final key = navBarkeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 800,
      ),
      curve: Curves.easeInOut,
    );
  }
}
