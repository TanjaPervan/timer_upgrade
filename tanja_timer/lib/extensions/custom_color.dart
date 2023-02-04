import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get appBarGradientBegin => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientBegin!;
  Color get appBarGradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientEnd!;
  Color get backgroundGradientStart => Theme.of(_context).extension<CustomColorScheme>()!.backgroundGradientStart!;
  Color get timerBackground => Theme.of(_context).extension<CustomColorScheme>()!.timerBackground!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? appBarGradientBegin;
  final Color? appBarGradientEnd;
  final Color? backgroundGradientStart;
  final Color? timerBackground;

  const CustomColorScheme({
    required this.primary,
    this.appBarGradientBegin,
    this.appBarGradientEnd,
    required this.timerBackground,
    required this.backgroundGradientStart,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff333333),
    this.backgroundGradientStart = const Color(0xffBDC1D1),
    this.appBarGradientBegin = const Color(0xffF7F8FA),
    this.appBarGradientEnd = const Color(0xffF7F8FA),
    this.timerBackground = const Color(0xffff9900),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? appBarGradientBegin,
    Color? appBarGradientEnd,
    Color? backgroundGradientStart,
    Color? timerBackground,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      appBarGradientBegin: appBarGradientBegin ?? this.appBarGradientBegin,
      appBarGradientEnd: appBarGradientEnd ?? this.appBarGradientEnd,
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
      appBarGradientBegin: Color.lerp(appBarGradientBegin, other.appBarGradientBegin, t),
      backgroundGradientStart: Color.lerp(backgroundGradientStart, other.backgroundGradientStart, t),
      appBarGradientEnd: Color.lerp(appBarGradientEnd, other.appBarGradientEnd, t),
      timerBackground: Color.lerp(timerBackground, other.timerBackground, t),
    );
  }
}
