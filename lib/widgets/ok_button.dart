import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';

class OkButton extends StatelessWidget {
  final VoidCallback onTap;

  const OkButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () => onTap(),
      child: SizedBox(
        height: 64,
        width: 228,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: CustomColors.of(context).secondary,
            borderRadius: BorderRadius.circular(40),
            boxShadow: const [
              BoxShadow(color: Color(0xffBDC1D1), blurRadius: 19.0, offset: Offset(4.0, 3.0)),
              BoxShadow(color: Color(0xffFAFBFC), blurRadius: 16.0, offset: Offset(-7.0, -7.0)),
            ],
          ),
          child: Center(
            child: Text(
              'button_ok'.tr().toUpperCase(),
              style: CustomTextStyles.of(context).semiBold20.copyWith(
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: const Color(0xff4C546A).withOpacity(0.2),
                    blurStyle: BlurStyle.inner,
                    blurRadius: 1.0,
                    offset: const Offset(0.0, 1.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
