import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tanja_timer/extensions/custom_color.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';

class OkButton extends StatelessWidget {
  const OkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width - 93,
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
          'Ok'.toUpperCase().tr(),
          style: CustomTextStyles.of(context).semiBold20.copyWith(color: Colors.white).apply(
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
    );
  }
}
