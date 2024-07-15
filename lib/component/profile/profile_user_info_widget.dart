import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    required this.photoUrl,
    required this.name,
    required this.email,
  });

  final String photoUrl;
  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 64.adaptSize,
          height: 64.adaptSize,
          margin: EdgeInsets.only(left: 16.v),
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(photoUrl),
            ),
          ),
        ),
        SizedBox(width: 18.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: name, fontSize: 18.fSize, color: AppColors.blackColor),
            CustomText(text: email, fontSize: 14.fSize, color: AppColors.greyColor),
          ],
        ),
      ],
    );
  }
}
