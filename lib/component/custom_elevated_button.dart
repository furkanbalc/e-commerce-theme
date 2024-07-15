import 'package:flutter/material.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

import 'custom_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.padding,
    this.buttonWidth,
    this.buttonHeight,
    this.leftIcon,
    this.rightIcon,
  });

  final String text;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback onPressed;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth ?? double.maxFinite,
      height: buttonHeight ?? 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(25),
          ),
          shadowColor: AppColors.blackColor,
          elevation: 5,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding ?? EdgeInsets.all(14.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? const SizedBox.shrink(),
              CustomText(text: text, fontSize: fontSize ?? 14.fSize, color: textColor ?? Colors.white),
              rightIcon ?? const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
