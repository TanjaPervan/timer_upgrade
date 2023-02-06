import 'package:flutter/material.dart';

class CustomColors {
  final BuildContext _context;
  const CustomColors.of(BuildContext context) : _context = context;

  Color get primary => Theme.of(_context).extension<CustomColorScheme>()!.primary!;
  Color get gradientBegin => Theme.of(_context).extension<CustomColorScheme>()!.gradientBegin!;
  Color get gradientEnd => Theme.of(_context).extension<CustomColorScheme>()!.gradientEnd!;
  Color get shadowAppBarFirst => Theme.of(_context).extension<CustomColorScheme>()!.shadowAppBarFirst!;
  Color get shadowAppBarSecond => Theme.of(_context).extension<CustomColorScheme>()!.shadowAppBarSecond!;
  Color get secondary => Theme.of(_context).extension<CustomColorScheme>()!.secondary!;
  Color get shadowWhite => Theme.of(_context).extension<CustomColorScheme>()!.shadowWhite!;
  Color get shadowWhiteSec => Theme.of(_context).extension<CustomColorScheme>()!.shadowWhiteSec!;
  Color get shadowWhiteThee => Theme.of(_context).extension<CustomColorScheme>()!.shadowWhiteThee!;
  Color get gradientButton => Theme.of(_context).extension<CustomColorScheme>()!.gradientButton!;
}

@immutable
class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  final Color? primary;
  final Color? gradientBegin;
  final Color? gradientEnd;
  final Color? shadowAppBarFirst;
  final Color? shadowAppBarSecond;
  final Color? secondary;
  final Color? shadowWhite;
  final Color? shadowWhiteSec;
  final Color? shadowWhiteThee;
  final Color? gradientButton;

  const CustomColorScheme({
    required this.primary,
    required this.gradientBegin,
    required this.gradientEnd,
    required this.secondary,
    required this.shadowAppBarFirst,
    required this.shadowAppBarSecond,
    required this.shadowWhiteSec,
    required this.shadowWhite,
    required this.shadowWhiteThee,
    required this.gradientButton,
  });

  const CustomColorScheme.light({
    this.primary = const Color(0xff333333),
    this.gradientEnd = const Color(0xffF7F8FA),
    this.gradientBegin = const Color(0xffE6E7ED),
    this.secondary = const Color(0xffff9900),
    this.shadowAppBarFirst = const Color(0xffBDC1D1),
    this.shadowAppBarSecond = const Color(0xffFAFCFC),
    this.shadowWhite = const Color(0xffFAFBFC),
    this.shadowWhiteSec = const Color(0xffF5F6FA),
    this.shadowWhiteThee = const Color(0xffE9EAF2),
    this.gradientButton = const Color(0xff40485D),
  });

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? gradientBegin,
    Color? gradientEnd,
    Color? shadowAppBarFirst,
    Color? shadowAppBarSecond,
    Color? secondary,
    Color? shadowWhite,
    Color? shadowWhiteSec,
    Color? shadowWhiteThee,
    Color? gradientButton,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      gradientBegin: gradientBegin ?? this.gradientBegin,
      gradientEnd: gradientEnd ?? this.gradientEnd,
      shadowAppBarFirst: shadowAppBarFirst ?? this.shadowAppBarFirst,
      shadowAppBarSecond: shadowAppBarSecond ?? this.shadowAppBarSecond,
      secondary: secondary ?? this.secondary,
      shadowWhite: shadowWhite ?? this.shadowWhite,
      shadowWhiteSec: shadowWhiteSec ?? this.shadowWhiteSec,
      shadowWhiteThee: shadowWhiteThee ?? this.shadowWhiteThee,
      gradientButton: gradientButton ?? this.gradientButton,
    );
  }

  @override
  CustomColorScheme lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t),
      gradientBegin: Color.lerp(gradientBegin, other.gradientBegin, t),
      shadowAppBarFirst: Color.lerp(shadowAppBarFirst, other.shadowAppBarFirst, t),
      shadowAppBarSecond: Color.lerp(shadowAppBarSecond, other.shadowAppBarSecond, t),
      gradientEnd: Color.lerp(gradientEnd, other.gradientEnd, t),
      secondary: Color.lerp(secondary, other.secondary, t),
      shadowWhite: Color.lerp(shadowWhite, other.shadowWhite, t),
      shadowWhiteSec: Color.lerp(shadowWhiteSec, other.shadowWhiteSec, t),
      shadowWhiteThee: Color.lerp(shadowWhiteSec, other.shadowWhiteSec, t),
      gradientButton: Color.lerp(gradientButton, other.gradientButton, t),
    );
  }
}
