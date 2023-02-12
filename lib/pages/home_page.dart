import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/pages/timer_page.dart';
import 'package:tanja_timer/providers/home_provider.dart';
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

    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          return GestureDetector(
            onTap: () => unFocusField(),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: const CustomAppBar.center(),
              body: BackgroundGradient(
                screenHeight: screenHeight,
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight / 2 - 91,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'home_text'.tr(),
                            style: CustomTextStyles.of(context).regular16.apply(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 34),
                    ShadowsGradients.inputField(
                      child: TextField(
                        controller: homeProvider.controller,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(top: 36),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        textAlign: TextAlign.center,
                        cursorColor: CustomColors.of(context).primary,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 2 - 117,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OkButton(
                            onTap: () {
                              String minutes = homeProvider.getMinute();
                              if (minutes.isNotEmpty) context.pushNamed(TimerPage.pageName, params: {'minutes': minutes});

                              homeProvider.clear();
                            },
                          ),
                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom)),
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

  void unFocusField() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
