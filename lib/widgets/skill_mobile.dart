import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/skill_items.dart';

class SkillMobileView extends StatelessWidget {
  const SkillMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        children: [
          // platform
          for (int i = 0; i < platformIcon.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 5.0),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: CustomColor.bglight2,
                  borderRadius: BorderRadius.circular(5.0)),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                leading: Image.asset(platformIcon[i]["img"]),
                title: Text(platformIcon[i]["title"]),
              ),
            ),
          // skills

          const SizedBox(
            height: 50,
          ),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              for (int i = 0; i < skillList.length; i++)
                Chip(
                  backgroundColor: CustomColor.bglight2,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  label: Text(skillList[i]["title"]),
                  avatar:
                      Image.asset(skillList[i]["img"], width: double.maxFinite),
                ),
            ],
          )
        ],
      ),
    );
  }
}
