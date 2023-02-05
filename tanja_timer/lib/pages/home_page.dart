import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/pages/timer_page.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';
import 'package:tanja_timer/widgets/background_gradient.dart';
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
      body: BackgroundGradient(
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
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 2)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
