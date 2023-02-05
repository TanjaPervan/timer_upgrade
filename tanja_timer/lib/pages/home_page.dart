import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/shadow_gradient_widget.dart';

class HomePage extends StatelessWidget {
  static const pageName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar.leading(),
      body: DecoratedBox(
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
        child: Column(
          children: const [
            SizedBox(height: 100),
            Center(child: ShadowGradientWidget()),
          ],
        ),
      ),
    );
  }
}
