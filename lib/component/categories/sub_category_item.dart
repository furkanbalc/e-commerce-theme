import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class SubCategoryItem extends StatelessWidget {
  const SubCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 36.0),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        onTap: () {},
        child: CustomText(
          text: 'Shirts & Blouses',
          fontSize: 16.fSize,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
