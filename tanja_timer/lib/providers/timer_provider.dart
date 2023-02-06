import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;

  Timer get timer => _timer!;

  void play(int minute) {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      print(timer.tick);
      minute--;
      if (minute == 0 || timer.isActive == false) {
        print('Cancel timer');
        timer.cancel();
        notifyListeners();
      }
    });
  }
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
