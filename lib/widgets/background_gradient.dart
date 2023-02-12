import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;
  final double screenHeight;
  const BackgroundGradient({super.key, required this.child, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      width: double.infinity,
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            transform: const GradientRotation(278.75 * pi / 180),
            colors: [
              CustomColors.of(context).gradientBegin,
              CustomColors.of(context).gradientEnd,
            ],
            stops: const [0.2585, 0.8581],
          ),
        ),
        child: child,
      ),
    );
  }
}
