import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  final String _minutes;
  Duration? myDuration;
  Timer? timer;
  double _progress = 0;
  bool _isActive = false;

  bool get isActive => _isActive;
  double get progress => _progress;

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
        print(x);
        print(_progress);
        print(seconds);
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
