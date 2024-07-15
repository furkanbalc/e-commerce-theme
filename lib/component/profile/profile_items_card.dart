import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class ProfileItemsCard extends StatelessWidget {
  const ProfileItemsCard({
    super.key,
    required this.onPressed,
    required this.title,
    required this.subTitle,
  });

  final VoidCallback onPressed;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5.208,
      child: ListTile(
        onTap: onPressed,
        tileColor: AppColors.backgroundColor,
        title: CustomText(text: title, fontSize: 16.fSize, color: AppColors.blackColor),
        subtitle: CustomText(text: subTitle, fontSize: 11.fSize, color: AppColors.greyColor),
        trailing: Icon(Icons.chevron_right, color: AppColors.greyColor,size: 20.adaptSize),
      ),
    );
  }
}
