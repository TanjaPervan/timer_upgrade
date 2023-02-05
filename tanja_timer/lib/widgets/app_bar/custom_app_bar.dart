import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/widgets/app_bar/leading_app_bar.dart';

enum _AppBarStyle { center, leading }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _AppBarStyle _type;

  const CustomAppBar.center({
    super.key,
  }) : _type = _AppBarStyle.center;

  const CustomAppBar.leading({
    super.key,
  }) : _type = _AppBarStyle.leading;

  Widget title(BuildContext context) {
    switch (_type) {
      case _AppBarStyle.center:
        return Text('timer'.tr(), style: CustomTextStyles.of(context).bold24);

      case _AppBarStyle.leading:
        return const LeadingAppBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: title(context),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColors.of(context).shadowAppBarFirst,
              blurRadius: 40.0,
              spreadRadius: 0.0,
              offset: const Offset(20.0, 10.0),
            ),
            BoxShadow(
              color: CustomColors.of(context).shadowAppBarSecond,
              blurRadius: 42.0,
              spreadRadius: 0.0,
              offset: const Offset(-10.0, -10.0),
            ),
          ],
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
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
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(52);
}
