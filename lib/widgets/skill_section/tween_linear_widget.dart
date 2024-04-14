import 'package:flutter/material.dart';
import 'package:portfolio_web/constants/colors.dart';

class TweenLinerWidget extends StatefulWidget {
  final Map skillData;
  final AnimationController controller;
  const TweenLinerWidget({
    super.key,
    required this.skillData,
    required this.controller,
  });

  @override
  State<TweenLinerWidget> createState() => _TweenLinerWidgetState();
}

class _TweenLinerWidgetState extends State<TweenLinerWidget> {
  @override
  Widget build(BuildContext context) {
    Animation animation =
        Tween<double>(begin: 0, end: widget.skillData['percentage'] / 100)
            .animate(widget.controller);
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 2, 2, 8),
      child: AnimatedBuilder(
        // tween: Tween(begin: 0, end: widget.skillData['percentage'] / 100),
        // duration: const Duration(seconds: 1),
        animation: animation,
        builder: (context, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      widget.skillData['img'],
                      width: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.skillData['title']),
                  ],
                ),
                Text(
                  '${(animation.value * 100).toInt()}%',
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              value: animation.value,
              color: CustomColor.yellowPrimary,
              backgroundColor: CustomColor.whitePrimary,
            ),
          ],
        ),
      ),
    );
  }
}
