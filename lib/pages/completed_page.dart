import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/pages/home_page.dart';
import 'package:tanja_timer/providers/completed_provider.dart';
import 'package:tanja_timer/widgets/background_gradient.dart';
import 'package:tanja_timer/widgets/ok_button.dart';

class CompletedPage extends StatelessWidget {
  static const pageName = 'completed_mission';

  final String minutes;
  const CompletedPage({super.key, required this.minutes});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => CompletedProvider(minutes),
      child: Scaffold(
        body: BackgroundGradient(
          screenHeight: screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('completed_mission'.tr(), style: CustomTextStyles.of(context).bold32),
              const SizedBox(height: 42),
              Selector<CompletedProvider, String>(
                selector: (_, provider) => provider.min,
                builder: (context, minutes, child) {
                  return SizedBox(
                    height: 46,
                    child: Text('completed_text'.tr(args: [minutes]),
                        textAlign: TextAlign.center, style: CustomTextStyles.of(context).regular16),
                  );
                },
              ),
              const SizedBox(height: 18),
              Text(
                'completed_coins'.tr(),
                style: CustomTextStyles.of(context).bold32.apply(color: CustomColors.of(context).secondary),
              ),
              Image.asset(
                'assets/images/coins.png',
                height: screenHeight / 2,
                fit: BoxFit.cover,
              ),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OkButton(onTap: () => context.pushNamed(HomePage.pageName)),
                    // Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom)),
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
