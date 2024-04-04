import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/project_utils.dart';
import 'package:portfolio_web/widgets/project_card_widget.dart';

class WorkProjectTabView extends StatelessWidget {
  const WorkProjectTabView({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < workProjects.length; i++)
                  ProjectCardWidget(
                    projectUtil: workProjects[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
