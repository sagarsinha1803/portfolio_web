import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';
import 'package:portfolio_web/utils/project_utils.dart';
import 'package:portfolio_web/widgets/project_section/project_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProjectsCarouselView extends StatefulWidget {
  final int windowSize;
  final int projectCount;
  // final double screenHeight;
  final List<ProjectUtils> projects;

  const ProjectsCarouselView({
    super.key,
    required this.windowSize,
    required this.projectCount,
    required this.projects,
    // required this.screenHeight,
  });

  @override
  State<ProjectsCarouselView> createState() => _ProjectsCarouselViewState();
}

class _ProjectsCarouselViewState extends State<ProjectsCarouselView> {
  CarouselController buttonCarouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<int> zerosArray = List<int>.filled(
        widget.windowSize < widget.projectCount
            ? widget.windowSize
            : widget.projectCount,
        0);
    int totalPages = (widget.projectCount / widget.windowSize).ceil();
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 50,
        ),
        CarouselSlider.builder(
          itemCount: (widget.projectCount / widget.windowSize).ceil(),
          itemBuilder: (context, index, realIndex) {
            int initIndex = (realIndex - 10000) * widget.windowSize;
            zerosArray.asMap().forEach(
              (index, value) {
                zerosArray[index] = (initIndex + index) % widget.projectCount;
              },
            );
            return Wrap(
              spacing: 100,
              children: zerosArray.map((idx) {
                return ProjectCardWidget(
                  projectUtil: widget.projects[idx],
                );
              }).toList(),
            );
          },
          options: CarouselOptions(
            enableInfiniteScroll: (totalPages == 1) ? false : true,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
            viewportFraction: 1,
            height: 320,
          ),
        ),
        const SizedBox(height: 40),
        if (totalPages > 1) dotIndicator(currentIndex, totalPages),
      ],
    );
  }

  Widget dotIndicator(int currentIndex, int pageCount) {
    return AnimatedSmoothIndicator(
      // onDotClicked: (index) {
      //   setState(() {
      //     currentIndex = index;
      //     dotIndicator(currentIndex, pageCount);
      //   });
      // },
      activeIndex: currentIndex,
      count: pageCount,
      effect: const ExpandingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          dotColor: CustomColor.bglight2,
          activeDotColor: CustomColor.yellowSecondary),
    );
  }
}
