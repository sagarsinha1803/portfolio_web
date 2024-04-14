import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/skill_items.dart';
import 'package:portfolio_web/widgets/skill_section/tween_circular_widget.dart';
import 'package:portfolio_web/widgets/skill_section/tween_linear_widget.dart';

class TweenSkillMobile extends StatelessWidget {
  final AnimationController controller;
  const TweenSkillMobile({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(colors: [
              CustomColor.scaffoldBg.withOpacity(0.9),
              CustomColor.whitePrimary.withOpacity(0.9),
              CustomColor.yellowPrimary.withOpacity(0.9),
            ]).createShader(bounds);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 120),
            child: Lottie.asset(
              'assets/animation/9cnb8OB2zC.json',
              width: 390,
              height: 390,
            ),
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Wrap(
            spacing: 1,
            runSpacing: 1,
            children: [
              for (int i = 0; i < platformIcon.length; i++)
                Card(
                  elevation: 10,
                  child: SizedBox(
                    width: 200,
                    child: TweenCirculerWidget(
                      skillData: platformIcon[i],
                      controller: controller,
                    ),
                  ),
                ),
            ],
          ),
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            SizedBox(
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 0; i < skillList.length; i++)
                    TweenLinerWidget(
                      skillData: skillList[i],
                      controller: controller,
                    ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
