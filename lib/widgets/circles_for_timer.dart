import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/widgets/fields_shadows_gradients.dart';

class CirclesForTimer extends StatelessWidget {
  final String minutes;
  final Color color;
  final double? progress;
  final String textButton;

  const CirclesForTimer({
    super.key,
    required this.minutes,
    this.progress,
    required this.textButton,
    required this.color,
  });

  List<BoxShadow> get shadows => const [
        BoxShadow(color: Color(0xffEBECF0), blurRadius: 7.0, blurStyle: BlurStyle.inner, offset: Offset(1.0, 1.0)),
        BoxShadow(color: Color(0xffBDC1D1), blurRadius: 10.0, blurStyle: BlurStyle.inner, offset: Offset(-3, -3)),
        BoxShadow(color: Color(0xffFAFBFC), blurRadius: 8.0, blurStyle: BlurStyle.normal, offset: Offset(5, 4)),
      ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 16,
      height: MediaQuery.of(context).size.width - 16,
      child: Stack(
        children: [
          const Positioned(child: FieldsShadowsGradients.bigRound()),
          Positioned(
            bottom: 16,
            top: 16,
            left: 16,
            right: 16,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: CircularProgressIndicator(
                strokeWidth: 10,
                valueColor: AlwaysStoppedAnimation<Color>(color),
                backgroundColor: Colors.transparent,
                value: progress,
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
                borderRadius: BorderRadius.circular(500),
                boxShadow: shadows,
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
                borderRadius: BorderRadius.circular(500),
                border: Border.all(
                  color: CustomColors.of(context).gradientEnd.withOpacity(1),
                  width: 0,
                ),
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.centerLeft,
                  colors: [
                    CustomColors.of(context).gradientBegin.withOpacity(0),
                    CustomColors.of(context).gradientEnd.withOpacity(0.6),
                  ],
                ),
                boxShadow: shadows,
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
                borderRadius: BorderRadius.circular(500),
                gradient: LinearGradient(
                  transform: const GradientRotation(pi),
                  colors: [
                    CustomColors.of(context).secondary.withOpacity(1),
                    CustomColors.of(context).secondary.withOpacity(0),
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
                Text(minutes, style: CustomTextStyles.of(context).bold48),
                Text(textButton, style: CustomTextStyles.of(context).regular14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
