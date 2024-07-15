import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _forgotYourPassword();
  }

  /// Forgot your password
  Widget _forgotYourPassword() {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(text: title, fontSize: 14.fSize),
            SizedBox(width: 4.v),
            const CustomSvgWidget(svg: Assets.zaraSvgArrowRightLong),
          ],
        ),
      ),
    );
  }
}
