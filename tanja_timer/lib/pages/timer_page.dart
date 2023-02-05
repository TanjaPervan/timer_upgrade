import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/timer_circle.dart';

class TimerPage extends StatelessWidget {
  static const pageName = 'timer';

  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.leading(onTapBack: () => context.pop()),
      body: Center(child: TimerCircle()),
    );
  }
}
