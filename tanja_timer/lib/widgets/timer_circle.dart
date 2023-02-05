import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/widgets/shadows_gradients.dart';

class TimerCircle extends StatelessWidget {
  const TimerCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 16,
      height: MediaQuery.of(context).size.width - 16,
      child: Stack(
        children: [
          Positioned(child: ShadowsGradients.bigRound(child: Center(child: Text('data')))),
          Positioned(
            bottom: 31,
            top: 31,
            left: 31,
            right: 31,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xffEBECF0),
                borderRadius: BorderRadius.circular(175),
                boxShadow: shadows(),
              ),
            ),
          ),
          Positioned(
            bottom: 31,
            top: 31,
            left: 31,
            right: 31,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(175),
                border: Border.all(
                  style: BorderStyle.solid,
                  color: CustomColors.of(context).gradientEnd.withOpacity(1),
                  width: 1,
                ),
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.center,
                  colors: [
                    CustomColors.of(context).gradientBegin.withOpacity(1),
                    CustomColors.of(context).gradientEnd.withOpacity(1),
                  ],
                ),
                boxShadow: shadows(),
              ),
            ),
          ),
          Positioned(
            bottom: 42,
            top: 42,
            left: 42,
            right: 42,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(175),
                gradient: LinearGradient(
                  transform: const GradientRotation(pi),
                  colors: [
                    Colors.orange.withOpacity(1),
                    Colors.orange.withOpacity(0),
                  ],
                  stops: const [0, 1],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BoxShadow> shadows() {
    return const [
      BoxShadow(
        color: Color(0xffFAFBFC),
        blurRadius: 10.0,
        blurStyle: BlurStyle.inner,
        offset: Offset(-5.0, -4.0),
      ),
      BoxShadow(
        color: Color(0xffBDC1D1),
        blurRadius: 8.0,
        //spreadRadius: -3,
        blurStyle: BlurStyle.inner,
        offset: Offset(3, 3),
      ),
      BoxShadow(
        color: Color(0xffEBECF0),
        blurRadius: 7.0,
        blurStyle: BlurStyle.normal,
        offset: Offset(-1.0, -1.0),
      ),
    ];
  }
}
