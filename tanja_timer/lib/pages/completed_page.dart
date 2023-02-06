import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/pages/home_page.dart';
import 'package:tanja_timer/widgets/background_gradient.dart';
import 'package:tanja_timer/widgets/ok_button.dart';

class CompletedPage extends StatelessWidget {
  static const pageName = 'completed_mission';

  const CompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundGradient(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 48),
            Text('Mission Completed', style: CustomTextStyles.of(context).bold32),
            const SizedBox(height: 42),
            SizedBox(
              width: 239,
              height: 46,
              child: Text('  Great job. You finished your\n mission in 25min. You earned',
                  style: CustomTextStyles.of(context).regular16),
            ),
            const SizedBox(height: 18),
            Text(
              '50 coins',
              style: CustomTextStyles.of(context).bold32.apply(color: CustomColors.of(context).secondary),
            ),
            Image.asset('assets/images/coins.png'),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OkButton(onTap: () => context.pushNamed(HomePage.pageName)),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
