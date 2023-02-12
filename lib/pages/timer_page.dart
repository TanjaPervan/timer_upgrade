import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tanja_timer/pages/completed_page.dart';
import 'package:tanja_timer/providers/timer_provider.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/background_gradient.dart';
import 'package:tanja_timer/widgets/custom_button.dart';
import 'package:tanja_timer/widgets/circles_for_timer.dart';

class TimerPage extends StatelessWidget {
  static const pageName = 'minutes';

  final String minutes;

  const TimerPage({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    format(Duration d) => d.toString().split('.').first.padLeft(8, "0");

    return ChangeNotifierProvider<TimerProvider>(
      create: (context) => TimerProvider(minutes),
      child: Consumer<TimerProvider>(
        builder: (context, provider, child) {
          return Scaffold(
            appBar: CustomAppBar.leading(onTapBack: () => context.pop()),
            body: BackgroundGradient(
              child: SizedBox(
                height: screenHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CirclesForTimer(
                      minutes: format(provider.myDuration!),
                      textButton: provider.isActive ? 'timer_remaining'.tr() : 'timer_pause'.tr(),
                      progress: provider.progress,
                    ),
                    const SizedBox(height: 98),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          provider.isActive && format(provider.myDuration!) != '00:00:00'
                              ? CustomButton.pause(onPressed: () => provider.stopTimer())
                              : CustomButton.play(onPressed: () => provider.startTimer()),
                          CustomButton.powerOff(
                            onPressed: () {
                              provider.isActive
                                  ? [
                                      provider.resetTimer(),
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () => context.pushNamed(CompletedPage.pageName),
                                      ),
                                    ]
                                  : [
                                      provider.durationZero(),
                                      Future.delayed(
                                        const Duration(seconds: 2),
                                        () => context.pushNamed(CompletedPage.pageName),
                                      ),
                                    ];
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
