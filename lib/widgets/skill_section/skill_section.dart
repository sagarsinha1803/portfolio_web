import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants/colors.dart';
import '/constants/size.dart';
import '/widgets/skill_section/tween_skill_desktop.dart';
import '/widgets/skill_section/tween_skill_mobile.dart';
import '/widgets/skill_section/tween_skill_tablet.dart';

class SkillSection extends StatelessWidget {
  final double screenWidth;
  final AnimationController controller;
  const SkillSection({
    super.key,
    required this.screenWidth,
    required this.controller,
  });

  get children => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: CustomColor.bglight2.withOpacity(0.4)),
      width: screenWidth,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: Text(
              "What I can do ",
              style: GoogleFonts.sriracha(
                color: CustomColor.whitePrimary,
                fontSize: 40,
                wordSpacing: 5,
              ),
            ),
          ),
          screenWidth > skillSectionSize["desktop"]!
              ? TweenSkillDesktop(controller: controller)
              : (screenWidth > skillSectionSize["tablet"]!
                  ? TweenSkillTablet(controller: controller)
                  : TweenSkillMobile(controller: controller))
        ],
      ),
    );
  }
}
