import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/pages/timer_page.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/ok_button.dart';
import 'package:tanja_timer/widgets/shadows_gradients.dart';

class HomePage extends StatelessWidget {
  static const pageName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CustomAppBar.center(),
      body: SizedBox(
        height: screenHeight,
        width: double.infinity,
        child: DecoratedBox(
          position: DecorationPosition.background,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              transform: const GradientRotation(278.75 * pi / 180),
              colors: [
                CustomColors.of(context).gradientBegin,
                CustomColors.of(context).gradientEnd,
              ],
              stops: const [0.2585, 0.8581],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight / 2 - 46,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Enter amount of time needed to\n complete a mission in minutes',
                      style: CustomTextStyles.of(context).regular16.apply(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 34),
              const ShadowsGradients.inputField(child: Center(child: Text('01:20'))),
              SizedBox(
                height: screenHeight / 2 - (86 + 77),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OkButton(onTap: () => context.pushNamed(TimerPage.pageName)),
                    const SizedBox(height: 77),
                  ],
                ),
              ),
            ],
          ),
          // child: Column(
          //   mainAxisSize: MainAxisSize.max,
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Align(
          //       alignment: Alignment.center,
          //       child: Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 59),
          //         child: Text(
          //           'Enter amount of time needed to\n complete a mission in minutes',
          //           style: CustomTextStyles.of(context).regular16.apply(),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(height: 34),
          //     const ShadowsGradients.inputField(
          //       child: Center(
          //         child: Text('01:20'),
          //       ),
          //     ),
          //     Align(alignment: Alignment.bottomCenter, child: OkButton(onTap: () {})),
          //     const Padding(
          //       padding: EdgeInsets.only(bottom: 77),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
