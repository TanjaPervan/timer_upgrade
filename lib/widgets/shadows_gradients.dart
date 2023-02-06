import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:tanja_timer/extensions/custom_color.dart';

enum _Type { inputField, buttonRound, bigRound }

class ShadowsGradients extends StatelessWidget {
  final _Type _type;
  final Widget? child;

  const ShadowsGradients.inputField({
    super.key,
    required this.child,
  }) : _type = _Type.inputField;

  const ShadowsGradients.bigRound({super.key})
      : _type = _Type.bigRound,
        child = null;

  const ShadowsGradients.buttonRound({
    super.key,
    required this.child,
  }) : _type = _Type.buttonRound;

  double get radius {
    switch (_type) {
      case _Type.inputField:
        return 10;
      case _Type.buttonRound:
        return 40;
      case _Type.bigRound:
        return 500;
    }
  }

  double height(BuildContext context) {
    switch (_type) {
      case _Type.inputField:
        return 52;
      case _Type.buttonRound:
        return 90;
      case _Type.bigRound:
        return 398;
    }
  }

  double width(BuildContext context) {
    switch (_type) {
      case _Type.inputField:
        return 228;
      case _Type.buttonRound:
        return 90;
      case _Type.bigRound:
        return 398;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context),
      width: width(context),
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.softLight,
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(
          transform: const GradientRotation(147 * pi / 180),
          colors: [const Color(0xff40485D).withOpacity(0.4), const Color(0xff606A82).withOpacity(0.4)],
          stops: const [0.0632, 0.9225],
        ),
        boxShadow: const [
          BoxShadow(color: Color(0xffE9EAF2), blurRadius: 16, blurStyle: BlurStyle.inner, offset: Offset(1.0, 1.0)),
          BoxShadow(color: Color(0xffF5F6FA), blurStyle: BlurStyle.inner, blurRadius: 16, offset: Offset(-1.0, -1.0)),
        ],
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            transform: const GradientRotation(128 * pi / 180),
            colors: [CustomColors.of(context).gradientEnd, CustomColors.of(context).gradientBegin],
            stops: const [-0.7965, 1.5125],
          ),
          boxShadow: const [
            BoxShadow(color: Color(0xffBDC1D1), blurRadius: 19.0, blurStyle: BlurStyle.normal, offset: Offset(4.0, 3.0)),
            BoxShadow(color: Color(0xffFAFBFC), blurStyle: BlurStyle.normal, blurRadius: 16.0, offset: Offset(-7.0, -7.0)),
          ],
        ),
        child: child,
      ),
    );
  }
}
