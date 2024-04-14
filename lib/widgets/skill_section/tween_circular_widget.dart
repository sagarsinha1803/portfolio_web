import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class TweenCirculerWidget extends StatefulWidget {
  final Map skillData;
  final AnimationController controller;
  // final Animation animation;
  const TweenCirculerWidget({
    super.key,
    required this.skillData,
    required this.controller,
    // required this.animation,
  });

  @override
  State<TweenCirculerWidget> createState() => _TweenCirculerWidgetState();
}

class _TweenCirculerWidgetState extends State<TweenCirculerWidget> {
  @override
  Widget build(BuildContext context) {
    Animation animation =
        Tween<double>(begin: 0, end: widget.skillData['percentage'] / 100)
            .animate(widget.controller);
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: AnimatedBuilder(
            // tween: Tween<double>(
            //     begin: 0, end: widget.skillData['percentage'] / 100),
            // duration: const Duration(seconds: 1),
            animation: animation,
            builder: (BuildContext context, Widget? child) => Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                    top: 0,
                    left: 0,
                    child: Image.asset(
                      widget.skillData['img'],
                      width: 40,
                    )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: SizedBox(
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      value: animation.value,
                      color: CustomColor.yellowPrimary,
                      backgroundColor: CustomColor.whitePrimary,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    '${(animation.value * 100).toInt()}%',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, bottom: 10),
          child: Text(
            widget.skillData['title'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        )
      ],
    );
  }
}
