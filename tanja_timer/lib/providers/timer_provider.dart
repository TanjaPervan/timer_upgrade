import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  final String _minutes;
  Duration? myDuration;
  Timer? countdownTimer;
  bool _isActive = false;

  bool get isActive => _isActive;

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
    }
    notifyListeners();
  }
}
