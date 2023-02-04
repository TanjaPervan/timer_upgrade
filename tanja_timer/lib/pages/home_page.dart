import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/widgets/app_bar/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  static const pageName = 'home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar.leading(),
      body: Center(
        child: Text(
          'timer'.tr(),
          style: CustomTextStyles.of(context).bold48,
        ),
      ),
    );
  }
}
