import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/skill_items.dart';

class SkillDesktopView extends StatelessWidget {
  const SkillDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Platforms
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: [
              for (int i = 0; i < platformIcon.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bglight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    leading: Image.asset(
                      platformIcon[i]["img"],
                      width: 33,
                    ),
                    title: Text(
                      platformIcon[i]["title"],
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(
          width: 50,
        ),
        //Skills
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 500,
            ),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
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
                    avatar: Image.asset(skillList[i]["img"],
                        width: double.maxFinite),
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
