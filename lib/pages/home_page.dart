import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/widgets/header_bar_mobile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: CustomColor.scaffoldBg,
      endDrawer: const Drawer(
        backgroundColor: CustomColor.scaffoldBg,
        // child: ListView(children: []),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // const HeaderBar(),
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
  }
}
