import 'package:flutter/cupertino.dart';
import 'package:tanja_timer/widgets/fields_shadows_gradients.dart';

enum _ButtonType { play, pause, powerOff }

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final _ButtonType _type;

  const CustomButton.play({
    super.key,
    required this.onPressed,
  }) : _type = _ButtonType.play;

  const CustomButton.pause({
    super.key,
    required this.onPressed,
  }) : _type = _ButtonType.pause;

  const CustomButton.powerOff({
    super.key,
    required this.onPressed,
  }) : _type = _ButtonType.powerOff;

  String get iconPath {
    switch (_type) {
      case _ButtonType.play:
        return 'assets/icons/icon_play.png';
      case _ButtonType.pause:
        return 'assets/icons/icon_pause.png';
      case _ButtonType.powerOff:
        return 'assets/icons/icon_power.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FieldsShadowsGradients.buttonRound(
      child: CupertinoButton(
        onPressed: onPressed,
        child: Image.asset(iconPath),
      ),
    );
  }
}
