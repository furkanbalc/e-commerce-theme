import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomPageTitleWidget extends StatelessWidget {
  const CustomPageTitleWidget({
    super.key,
    required this.pageTitle,
     this.padding,
  });

  final String pageTitle;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.h),
      child: CustomText(
        text: pageTitle,
        fontSize: 34.fSize,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor,
      ),
    );
  }
}
