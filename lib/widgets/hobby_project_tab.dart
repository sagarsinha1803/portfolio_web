import 'package:flutter/material.dart';
import 'package:portfolio_web/utils/project_utils.dart';
import 'package:portfolio_web/widgets/project_card_widget.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
    required this.screenWidth,
    required this.projects,
  });

  final double screenWidth;
  final List<ProjectUtils> projects;

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
                for (int i = 0; i < projects.length; i++)
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
