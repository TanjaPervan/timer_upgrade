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
                    ShadowsGradients.inputField(
                      child: TextField(
                        controller: homeProvider.controller,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: OutlineInputBorder(borderSide: BorderSide.none),
                        ),
                        cursorColor: CustomColors.of(context).primary,
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                      ),
                    ),
                    SizedBox(
                      height: screenHeight / 2 - (86 + 77),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OkButton(
                            onTap: (text) {
                              text = homeProvider.getText();
                              if (text != '') context.pushNamed(TimerPage.pageName, params: {'text': text});
                              homeProvider.clear();
                            },
                          ),
                          Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 2)),
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
