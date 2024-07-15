import 'package:flutter/material.dart';
import 'package:my_theme/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

/// Change Password Bottom Sheet
changePasswordBottomSheet(BuildContext context) {
  return customBottomSheet(
    context: context,
    title: 'Password Change',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomTextFormField(label: 'Old Password'),
        SizedBox(height: 14.h),
        const Align(
          alignment: Alignment.centerRight,
          child: CustomText(text: 'Forgot Password?', fontSize: 14, color: AppColors.greyColor),
        ),
        SizedBox(height: 18.h),
        const CustomTextFormField(label: 'New Password'),
        SizedBox(height: 24.h),
        const CustomTextFormField(label: 'Repeat New Password'),
        SizedBox(height: 32.h),
        CustomElevatedButton(
          onPressed: () {},
          text: 'SAVE PASSWORD',
        ),
      ],
    ),
  );
}
