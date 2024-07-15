import 'package:flutter/material.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.label,
    this.hintText,
    this.textInputAction,
    this.keyboardType,
    this.readOnly,
    this.onTap,
    this.suffixIcon,
    this.unFocus,
    this.obscureText,
    this.filled,
    this.fillColor,
    this.borderDecoration,
    this.controller,
    this.validator,
    this.maxLines,
    this.minLines,
    this.textStyle,
  });

  final String? label;
  final String? hintText;
  final TextInputAction? textInputAction;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final Widget? suffixIcon;
  final bool? readOnly;
  final int? maxLines;
  final int? minLines;
  final bool? unFocus;
  final bool? filled;
  final bool? obscureText;
  final Color? fillColor;
  final InputBorder? borderDecoration;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    return TextFormField(
      controller: controller,
      onTap: onTap,
      onTapOutside: (event) => (unFocus ?? false) ? currentFocus.unfocus() : null,
      validator: validator,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      minLines: minLines ?? 1,
      style: textStyle ?? TextStyle(fontSize: 14.fSize, fontWeight: FontWeight.w600, color: AppColors.blackColor),
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: EdgeInsets.all(12.v),
          child: suffixIcon,
        ),
        errorStyle: TextStyle(fontSize: 10.fSize, color: Colors.red),
        labelText: label,
        labelStyle: TextStyle(fontSize: 14.fSize, color: AppColors.greyColor),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14.fSize, color: AppColors.greyColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 12.v),
        fillColor: fillColor ?? Colors.white,
        filled: filled ?? true,
        border: UnderlineInputBorder(borderRadius: BorderRadius.circular(4.h), borderSide: BorderSide.none),
        enabledBorder: borderDecoration ??
            UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide.none,
            ),
        focusedBorder: borderDecoration ??
            UnderlineInputBorder(
              borderRadius: BorderRadius.circular(4.h),
              borderSide: BorderSide.none,
            ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4.h),
          borderSide: BorderSide(width: 1.h, color: Theme.of(context).colorScheme.error),
        ),
      ),
    );
  }
}
