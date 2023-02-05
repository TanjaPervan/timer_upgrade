import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
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
          const Positioned(child: ShadowsGradients.bigRound(child: Center(child: Text('data')))),
          const Positioned(
            bottom: 16,
            top: 16,
            left: 16,
            right: 16,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: CircularProgressIndicator(
                color: Colors.transparent,
                semanticsValue: '60',
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation(
                  2 == 3 ? Colors.transparent : Colors.orange,
                ),
                backgroundColor: Colors.transparent,
                value: 1 / 2,
              ),
            ),
          ),
          Positioned(
            bottom: 33,
            top: 33,
            left: 33,
            right: 33,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: const Color(0xffEBECF0),
                borderRadius: BorderRadius.circular(175),
                boxShadow: shadows(),
              ),
            ),
          ),
          Positioned(
            bottom: 33,
            top: 33,
            left: 33,
            right: 33,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(175),
                border: Border.all(
                  //strokeAlign: StrokeAlign.inside,
                  color: CustomColors.of(context).gradientEnd.withOpacity(1),
                  width: 0,
                ),
                gradient: LinearGradient(
                  end: Alignment.center,
                  begin: Alignment.center,
                  colors: [
                    CustomColors.of(context).gradientBegin,
                    CustomColors.of(context).gradientEnd,
                  ],
                ),
                boxShadow: shadows(),
              ),
            ),
          ),
          Positioned(
            bottom: 44,
            top: 44,
            left: 44,
            right: 44,
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
          Align(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('01:59:59', style: CustomTextStyles.of(context).bold48),
              Text(
                'REMAINING TIME',
                style: CustomTextStyles.of(context).regular14,
              )
            ],
          ))
        ],
      ),
    );
  }

  List<BoxShadow> shadows() {
    return const [
      BoxShadow(
        color: Color(0xffEBECF0),
        blurRadius: 7.0,
        blurStyle: BlurStyle.normal,
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
        offset: Offset(-5, -4),
      ),
    ];
  }
}
