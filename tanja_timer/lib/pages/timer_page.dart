import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/pages/completed_page.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/background_gradient.dart';
import 'package:tanja_timer/widgets/custom_button.dart';
import 'package:tanja_timer/widgets/timer_circle.dart';

class TimerPage extends StatelessWidget {
  static const pageName = 'timer';

  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar.leading(onTapBack: () => context.pop()),
      body: BackgroundGradient(
        child: SizedBox(
          height: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TimerCircle(),
              const SizedBox(height: 98),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton.play(onPressed: () {}),
                    CustomButton.powerOff(
                      onPressed: () => context.pushNamed(CompletedPage.pageName),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
