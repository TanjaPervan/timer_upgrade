import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  final String _minutes;
  Duration? myDuration;
  Timer? timer;
  double _progress = 0;
  bool _isActive = false;
  final List<Color> _colors = [
    Colors.orange.shade200,
    Colors.orange.shade300,
    Colors.orange.shade400,
    Colors.orange.shade400,
    Colors.orange.shade500,
    Colors.orange.shade500,
    Colors.orange.shade600,
    Colors.orange.shade600,
    Colors.orange.shade700,
  ];
  final List<double> _range = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

  bool get isActive => _isActive;
  double get progress => _progress;

  Color get color {
    Color c = Colors.orange.shade100;
    for (var i = 0; i < _range.length; i++) {
      if (_progress > _range.elementAt(i)) c = _colors.elementAt(i);
    }
    return c;
  }

  TimerProvider(this._minutes) {
    myDuration = Duration(minutes: int.parse(_minutes));
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _isActive = true;
    timer = Timer.periodic(const Duration(seconds: 1), (_) => setTimer());

    notifyListeners();
  }

  void stopTimer() {
    timer!.cancel();
    _isActive = false;

    notifyListeners();
  }

  void resetTimer() {
    timer!.cancel();
    myDuration = const Duration(seconds: 0);
    _isActive = false;
    notifyListeners();
  }

  void setTimer() {
    final seconds = myDuration!.inSeconds - 1;
    if (seconds < 0) {
      timer!.cancel();
    } else {
      double x = double.parse(_minutes) * 60;
      myDuration = Duration(seconds: seconds);
      if (_progress == 1) {
        timer!.cancel();
      } else {
        _progress += 1 / x;
      }
    }
    notifyListeners();
  }

  void durationZero() {
    myDuration = const Duration(minutes: 0);
    notifyListeners();
  }
}
