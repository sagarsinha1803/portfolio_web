import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/utils/project_utils.dart';
import 'package:portfolio_web/widgets/project_card_widget.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key, required this.screenWidth});

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          // WORK PROJECTS TITLE
          const Text(
            "Work Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // WORK PROJECTS CARD
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
          const SizedBox(
            height: 80,
          ),
          // HOBBY PROJECTS
          const Text(
            "Hobby Projects",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // Hobby PROJECTS CARD
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 900,
            ),
            child: Wrap(
              spacing: 25,
              runSpacing: 25,
              children: [
                for (int i = 0; i < hobbyProjects.length; i++)
                  ProjectCardWidget(
                    projectUtil: hobbyProjects[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
