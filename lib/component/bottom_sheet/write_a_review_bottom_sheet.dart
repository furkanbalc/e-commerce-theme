import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_theme/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

/// Change Password Bottom Sheet
writeReviewBottomSheet(BuildContext context, TextEditingController controller) {
  return customBottomSheet(
    context: context,
    title: 'What is your rate?',
    child: Column(
      mainAxisSize: MainAxisSize.min, // İçeriğin boyutuna göre ayarlanacak
      children: [
        SizedBox(
          height: 40.v,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 42.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                5,
                    (index) => SvgPicture.asset(
                  index != 4 ? Assets.zaraSvgStarFilled : Assets.zaraSvgStarOutlined,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 33.h),
        const CustomText(
          text: 'Please share your opinion\nabout the product',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          txtAlign: TextAlign.center,
        ),
        SizedBox(height: 18.h),
        CustomTextFormField(
          controller: controller,
          hintText: 'Your review',
          maxLines: 6,
          minLines: 6,
          textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, fontFamily: 'Metropolis'),
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: Container(
                height: 104.adaptSize,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/add-comments-photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.v),
            Expanded(
              child: Container(
                height: 104.adaptSize,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/png/add-comments-photo.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.v),
            Expanded(
              child: Container(
                height: 104.adaptSize,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: EdgeInsets.all(26.v),
                  child: CustomIconButton(
                    onPressed: () {},
                    icon: Assets.zaraSvgCamera,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 44.h),
        CustomElevatedButton(
          onPressed: () {},
          text: 'SEND REVIEW',
        ),
      ],
    ),
  );
}
