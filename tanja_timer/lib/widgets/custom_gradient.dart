import 'dart:math';
import 'package:flutter/material.dart';

LinearGradient customGradient({
  required double degrees,
  required List<double> stops,
  required Widget child,
  required List<Color> colors,
}) {
  return LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    transform: GradientRotation(degrees * pi / 180),
    colors: colors,
    stops: stops,
  );
}
