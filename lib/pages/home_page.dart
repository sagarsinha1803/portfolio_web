import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/widgets/header_bar.dart';
import 'package:portfolio_web/widgets/header_bar_mobile.dart';
import 'package:portfolio_web/widgets/mobile_view_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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

            //Skills
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
              child: const Center(
                child: Text("Skills"),
              ),
            ),
            //Projects
            Container(
              height: 500,
              width: double.maxFinite,
              child: const Center(
                child: Text("Projects"),
              ),
            ),
            //Contact
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.blueGrey,
              child: const Center(
                child: Text("Contact"),
              ),
            ),
            //Footer
            Container(
              height: 500,
              width: double.maxFinite,
              child: const Center(
                child: Text("Footer"),
              ),
            )
          ],
        ),
      );
    });
  }
}
