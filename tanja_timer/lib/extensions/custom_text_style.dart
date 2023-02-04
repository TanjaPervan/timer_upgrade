import 'package:flutter/material.dart';

class CustomTextStyles {
  final BuildContext _context;
  const CustomTextStyles.of(BuildContext context) : _context = context;

  TextStyle get regular14 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular14!;
  TextStyle get regular16 => Theme.of(_context).extension<CustomTextStyleScheme>()!.regular16!;
  TextStyle get semiBold20 => Theme.of(_context).extension<CustomTextStyleScheme>()!.semiBold20!;
  TextStyle get bold24 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold24!;
  TextStyle get bold32 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold32!;
  TextStyle get bold48 => Theme.of(_context).extension<CustomTextStyleScheme>()!.bold48!;
}

@immutable
class CustomTextStyleScheme extends ThemeExtension<CustomTextStyleScheme> {
  static const String _fontFamilyPoppins = 'Poppins';

  final TextStyle? regular14;
  final TextStyle? regular16;
  final TextStyle? semiBold20;
  final TextStyle? bold24;
  final TextStyle? bold32;
  final TextStyle? bold48;

  const CustomTextStyleScheme({
    required this.regular14,
    required this.regular16,
    required this.semiBold20,
    required this.bold24,
    required this.bold32,
    required this.bold48,
  });

  CustomTextStyleScheme.fromPrimaryTextColor(Color primaryTextColor)
      : regular14 = TextStyle(
          fontSize: 14,
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamilyPoppins,
        ),
        regular16 = TextStyle(
          fontSize: 16,
          color: primaryTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: _fontFamilyPoppins,
        ),
        semiBold20 = TextStyle(
          fontSize: 20,
          color: primaryTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: _fontFamilyPoppins,
        ),
        bold24 = TextStyle(
          fontSize: 24,
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamilyPoppins,
        ),
        bold32 = TextStyle(
          fontSize: 32,
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamilyPoppins,
        ),
        bold48 = TextStyle(
          fontSize: 48,
          color: primaryTextColor,
          fontWeight: FontWeight.w700,
          fontFamily: _fontFamilyPoppins,
        );
  @override
  CustomTextStyleScheme copyWith({
    TextStyle? regular14,
    TextStyle? regular16,
    TextStyle? semiBold20,
    TextStyle? bold24,
    TextStyle? bold32,
    TextStyle? bold48,
  }) {
    return CustomTextStyleScheme(
      regular14: regular14 ?? this.regular14,
      regular16: regular16 ?? this.regular16,
      semiBold20: semiBold20 ?? this.semiBold20,
      bold24: bold24 ?? this.bold24,
      bold32: bold32 ?? this.bold32,
      bold48: bold48 ?? this.bold48,
    );
  }

  @override
  CustomTextStyleScheme lerp(ThemeExtension<CustomTextStyleScheme>? other, double t) {
    if (other is! CustomTextStyleScheme) {
      return this;
    }
    return CustomTextStyleScheme(
      regular14: TextStyle.lerp(regular14, other.regular14, t),
      regular16: TextStyle.lerp(regular16, other.regular16, t),
      semiBold20: TextStyle.lerp(semiBold20, other.semiBold20, t),
      bold24: TextStyle.lerp(bold24, other.bold24, t),
      bold32: TextStyle.lerp(bold32, other.bold32, t),
      bold48: TextStyle.lerp(bold48, other.bold48, t),
    );
  }
}
