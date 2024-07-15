import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CampaignCard extends StatelessWidget {
  const CampaignCard({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(text: title, fontSize: 24.fSize, fontWeight: FontWeight.w600, color: Colors.white),
          SizedBox(height: 5.h),
          CustomText(text: subTitle, fontSize: 14.fSize, color: Colors.white),
        ],
      ),
    );
  }
}
