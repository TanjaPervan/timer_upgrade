import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  final String _minutes;
  Duration? myDuration;
  Timer? countdownTimer;
  double _progress = 0;
  bool _isActive = false;

  bool get isActive => _isActive;
  double get progress => _progress;

  TimerProvider(this._minutes) {
    myDuration = Duration(minutes: int.parse(_minutes));
  }

  void durationZero() {
    myDuration = const Duration(minutes: 0);
    notifyListeners();
  }

  void startTimer() {
    _isActive = true;

    countdownTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setCountDown(),
    );
    notifyListeners();
  }

  void stopTimer() {
    countdownTimer!.cancel();
    _isActive = false;
    notifyListeners();
  }

  void resetTimer() {
    countdownTimer!.cancel();
    myDuration = const Duration(seconds: 0);
    _isActive = false;

    notifyListeners();
  }

  void setCountDown() {
    final seconds = myDuration!.inSeconds - 1;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
      if (_progress == 1) {
        countdownTimer!.cancel();
      } else {
        _progress -= 360 / int.parse(_minutes);
      }
    }
    notifyListeners();
  }

  void initState() {
    _progress += 10;
    if (_progress >= 100) {
      countdownTimer!.cancel();
    }
    notifyListeners();
  }
}
