import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';
import 'package:tanja_timer/widgets/app_bar/title_app_bar.dart';

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
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: title(context),
      flexibleSpace: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: CustomColors.of(context).backgroundGradientStart,
              blurRadius: 40.0,
              spreadRadius: 0.0,
              offset: const Offset(20.0, 10.0),
            )
          ],
          borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20)),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [CustomColors.of(context).appBarGradientBegin, CustomColors.of(context).appBarGradientEnd],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
