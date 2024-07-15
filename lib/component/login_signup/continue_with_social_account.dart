import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class ContinueWithSocialAccount extends StatelessWidget {
  const ContinueWithSocialAccount({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return _loginWithSocial();
  }

  /// Login with social media buttons
  Widget _loginWithSocial() {
    return Column(
      children: [
        CustomText(text: 'Or sign up with social account', fontSize: 14.fSize, txtAlign: TextAlign.center),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(onTap: () {}, iconPath: Assets.zaraSvgGoogle),
            SizedBox(width: 16.v),
            _buildSocialButton(onTap: () {}, iconPath: Assets.zaraSvgFacebook),
          ],
        ),
      ],
    );
  }

  /// Build social media button
  Widget _buildSocialButton({required VoidCallback onTap, required String iconPath}) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      child: Container(
        width: 92.v,
        height: 64.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: SizedBox(
          child: CustomSvgWidget(svg: iconPath, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
