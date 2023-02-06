import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:tanja_timer/extensions/custom_text_style.dart';

class LeadingTitle extends StatelessWidget {
  final VoidCallback? onTapBack;
  const LeadingTitle({super.key, required this.onTapBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CupertinoButton(
          onPressed: onTapBack,
          child: Image.asset('assets/icons/icon_arrow_back.png'),
        ),
        const SizedBox(width: 2),
        Text('title'.tr(), style: CustomTextStyles.of(context).bold24),
      ],
    );
  }
}
