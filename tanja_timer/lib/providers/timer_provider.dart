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

  // Step 4
  void stopTimer() {
    countdownTimer!.cancel();
    _isActive = false;
    notifyListeners();
  }

  // Step 5
  void resetTimer() {
    countdownTimer!.cancel();
    myDuration = const Duration(seconds: 0);
    _isActive = false;

    notifyListeners();
  }

  // Step 6
  void setCountDown() {
    final seconds = myDuration!.inSeconds - 1;
    if (seconds < 0) {
      countdownTimer!.cancel();
    } else {
      myDuration = Duration(seconds: seconds);
    }
    notifyListeners();
  }

  // Timer? _timer;

  // Timer get timer => _timer!;

  // void clearMinutes(int minutes) {
  //   minutes = 0;
  //   notifyListeners();
  // }

  // void play(int minute) {
  //   Timer.periodic(const Duration(seconds: 2), (timer) {
  //     print(timer.tick);
  //     minute--;
  //     if (minute == 0 || timer.isActive == false) {
  //       print('Cancel timer');
  //       timer.cancel();
  //       notifyListeners();
  //     }
  //   });
  // }
}

//  myTimerFunction(){
// _timer = Timer.periodic(const Duration(seconds: 10 ), (_)=>startTimer(),);

// }

// startTimer(){
// //userInput--; 

// // if(userInput == put here your value that should stop timer when it arrive it){
// // myTimer!.cancel(); // 
// // }

// }
// }
