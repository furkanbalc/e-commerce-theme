import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomCheckBoxListTile extends StatelessWidget {
  const CustomCheckBoxListTile({
    super.key,
    this.onChanged,
    required this.title,
    required this.value,
  });

  final Function(bool?)? onChanged;
  final String title;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      contentPadding: EdgeInsets.zero,
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: AppColors.blackColor,
      checkColor: Colors.white,
      value: value,
      onChanged: onChanged,
      title: CustomText(
        text: title,
        fontSize: 14.fSize,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    );
  }
}
