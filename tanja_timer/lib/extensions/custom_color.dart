import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get appBarGradientBegin => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientBegin!;
  Color get appBarGradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.appBarGradientEnd!;
  Color get shadowAppBarFirst => Theme.of(_context).extension<CustomColorScheme>()!.shadowAppBarFirst!;
  Color get shadowAppBarSecond => Theme.of(_context).extension<CustomColorScheme>()!.shadowAppBarSecond!;
  Color get timerBackground => Theme.of(_context).extension<CustomColorScheme>()!.timerBackground!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? appBarGradientBegin;
  final Color? appBarGradientEnd;
  final Color? shadowAppBarFirst;
  final Color? shadowAppBarSecond;
  final Color? timerBackground;

  const CustomColorScheme({
    required this.primary,
    required this.appBarGradientBegin,
    required this.appBarGradientEnd,
    required this.timerBackground,
    required this.shadowAppBarFirst,
    required this.shadowAppBarSecond,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff333333),
    this.appBarGradientBegin = const Color(0xffF7F8FA),
    this.appBarGradientEnd = const Color(0xffF7F8FA),
    this.timerBackground = const Color(0xffff9900),
    this.shadowAppBarFirst = const Color(0xffBDC1D1),
    this.shadowAppBarSecond = const Color(0xffFAFCFC),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? appBarGradientBegin,
    Color? appBarGradientEnd,
    Color? shadowAppBarFirst,
    Color? shadowAppBarSecond,
    Color? timerBackground,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      appBarGradientBegin: appBarGradientBegin ?? this.appBarGradientBegin,
      appBarGradientEnd: appBarGradientEnd ?? this.appBarGradientEnd,
      shadowAppBarFirst: shadowAppBarFirst ?? this.shadowAppBarFirst,
      shadowAppBarSecond: shadowAppBarSecond ?? this.shadowAppBarSecond,
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
      shadowAppBarFirst: Color.lerp(shadowAppBarFirst, other.shadowAppBarFirst, t),
      shadowAppBarSecond: Color.lerp(shadowAppBarSecond, other.shadowAppBarSecond, t),
      appBarGradientEnd: Color.lerp(appBarGradientEnd, other.appBarGradientEnd, t),
      timerBackground: Color.lerp(timerBackground, other.timerBackground, t),
    );
  }
}
