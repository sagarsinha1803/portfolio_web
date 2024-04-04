import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/constants/size.dart';
import 'package:portfolio_web/utils/project_utils.dart';
import 'package:portfolio_web/widgets/project_carousal_view.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectTabView extends StatefulWidget {
  final double screenWidth;
  final double screenHeight;
  final double constrainMaxWidth;

  const ProjectTabView({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.constrainMaxWidth,
  });

  @override
  State<ProjectTabView> createState() => _ProjectTabViewState();
}

class _ProjectTabViewState extends State<ProjectTabView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.screenWidth,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Text(
            'My Projects',
            style: GoogleFonts.sriracha(
              color: CustomColor.whitePrimary,
              fontSize: 40,
              wordSpacing: 5,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            // height: 50,
            width: widget.screenWidth,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TabBar(
                isScrollable: false,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                dividerColor: Colors.transparent,
                unselectedLabelColor: CustomColor.bgLight1,
                labelColor: CustomColor.bgLight1,
                controller: tabController,
                indicatorColor: CustomColor.yellowPrimary,
                tabs: [
                  Tab(
                    child: Text(
                      "Hobby Project",
                      style: GoogleFonts.kalam(
                        color: CustomColor.whitePrimary,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Work Project",
                      style: GoogleFonts.kalam(
                        color: CustomColor.whitePrimary,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: [
                if (widget.constrainMaxWidth >= minProjectDesktopWidth)
                  ProjectsCarouselView(
                    windowSize: 4,
                    projectCount: hobbyProjects.length,
                    projects: hobbyProjects,
                  )
                else if (widget.constrainMaxWidth < minProjectDesktopWidth &&
                    widget.constrainMaxWidth >= minProjectTab1Width)
                  ProjectsCarouselView(
                    windowSize: 3,
                    projectCount: hobbyProjects.length,
                    projects: hobbyProjects,
                  )
                else if (widget.constrainMaxWidth < minProjectTab1Width &&
                    widget.constrainMaxWidth >= minProjectTab2Width)
                  ProjectsCarouselView(
                    windowSize: 2,
                    projectCount: hobbyProjects.length,
                    projects: hobbyProjects,
                  )
                else
                  ProjectsCarouselView(
                    windowSize: 1,
                    projectCount: hobbyProjects.length,
                    projects: hobbyProjects,
                  ),
                if (widget.constrainMaxWidth >= minProjectDesktopWidth)
                  ProjectsCarouselView(
                    windowSize: 4,
                    projectCount: workProjects.length,
                    projects: workProjects,
                  )
                else if (widget.constrainMaxWidth < minProjectDesktopWidth &&
                    widget.constrainMaxWidth >= minProjectTab1Width)
                  ProjectsCarouselView(
                    windowSize: 3,
                    projectCount: workProjects.length,
                    projects: workProjects,
                  )
                else if (widget.constrainMaxWidth < minProjectTab1Width &&
                    widget.constrainMaxWidth >= minProjectTab2Width)
                  ProjectsCarouselView(
                    windowSize: 2,
                    projectCount: workProjects.length,
                    projects: workProjects,
                  )
                else
                  ProjectsCarouselView(
                    windowSize: 1,
                    projectCount: workProjects.length,
                    projects: workProjects,
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
