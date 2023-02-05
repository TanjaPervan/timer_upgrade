import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tanja_timer/widgets/shadows_gradients.dart';

class TimerCircle extends StatelessWidget {
  const TimerCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: MediaQuery.of(context).size.width - 8,
      // height: MediaQuery.of(context).size.width - 8,
      child: Stack(
        children: [
          Positioned(child: ShadowsGradients.bigRound(child: Center(child: Text('data')))),
          Positioned(
            bottom: 31,
            top: 31,
            left: 31,
            child: Container(
              height: 334,
              width: 334,
              decoration: BoxDecoration(
                color: const Color(0xffEBECF0),
                borderRadius: BorderRadius.circular(175),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xffEBECF0),
                    blurRadius: 7.0,
                    blurStyle: BlurStyle.solid,
                    offset: Offset(1.0, 1.0),
                  ),
                  BoxShadow(
                    color: Color(0xffBDC1D1),
                    blurRadius: 8.0,
                    blurStyle: BlurStyle.inner,
                    offset: Offset(3, 3),
                  ),
                  BoxShadow(
                    color: Color(0xffFAFBFC),
                    blurRadius: 10.0,
                    blurStyle: BlurStyle.inner,
                    offset: Offset(-5.0, -4.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 42,
            top: 42,
            left: 42,
            child: Container(
              height: 309,
              width: 309,
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
    // Container(
    //   width: 398,
    //   height: 398,
    //   //padding: EdgeInsets.all(20),
    //   //okolo
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(200 - 30),
    //     border: Border.all(color: Colors.blue, width: 30),
    //   ),
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(270 - 50),
    //     child: DecoratedBox(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(220 - 50),
    //         border: Border.all(color: Colors.orange, width: 50),
    //         color: CustomColors.of(context).timerBackground,
    //       ),
    //       child: DecoratedBox(
    //         decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(170),
    //           color: CustomColors.of(context).primary,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
