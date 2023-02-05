import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';

enum ThemeMode { light }

class AppearanceService extends ChangeNotifier {
  var _mode = ThemeMode.light;

  ThemeMode get themeMode => _mode;

  ThemeData buildTheme() {
    final ThemeData theme;
    switch (_mode) {
      case ThemeMode.light:
        const colorScheme = CustomColorScheme.light();
        final textStyleScheme = CustomTextStyleScheme.fromPrimaryTextColor(colorScheme.primary!);
        theme = ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            ),
            //backgroundColor: Colors.transparent,
          ),
          brightness: Brightness.light,
          extensions: <ThemeExtension<dynamic>>[colorScheme, textStyleScheme],
        );
        break;
    }
    return theme;
  }

  void changeTheme(ThemeMode mode) {
    if (_mode != mode) {
      _mode = mode;
      notifyListeners();
    }
  }
}
