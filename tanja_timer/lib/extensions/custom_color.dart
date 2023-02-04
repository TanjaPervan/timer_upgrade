import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get backgroundGradientStart => Theme.of(_context).extension<CustomColorScheme>()!.backgroundGradientStart!;
  Color get timerBackground => Theme.of(_context).extension<CustomColorScheme>()!.timerBackground!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? backgroundGradientStart;
  final Color? timerBackground;

  const CustomColorScheme({
    required this.primary,
    required this.timerBackground,
    required this.backgroundGradientStart,
  });

  const CustomColorScheme.light({
    this.primary = Colors.black,
    this.backgroundGradientStart = const Color(0xffE6E7ED),
    this.timerBackground = const Color(0xffff9900),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? backgroundGradientStart,
    Color? timerBackground,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      backgroundGradientStart: backgroundGradientStart ?? this.backgroundGradientStart,
      timerBackground: timerBackground ?? this.timerBackground,
    );
  }

  @override
  CustomColorScheme lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      backgroundGradientStart: Color.lerp(backgroundGradientStart, other.backgroundGradientStart, t),
      timerBackground: Color.lerp(timerBackground, other.timerBackground, t),
    );
  }
}
