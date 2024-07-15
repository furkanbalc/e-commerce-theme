import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

Future<dynamic> customBottomSheet({
  required BuildContext context,
  required String title,
  required Widget child,
}) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Wrap(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.v),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // İçeriğin boyutuna göre ayarlanacak
              children: [
                Container(
                  width: 60.v,
                  height: 6.h,
                  margin: EdgeInsets.only(bottom: 16.v),
                  decoration: BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                CustomText(text: title, fontSize: 18, fontWeight: FontWeight.w600),
                SizedBox(height: 22.h),
                child,
              ],
            ),
          ),
        ],
      );
    },
  );
}
