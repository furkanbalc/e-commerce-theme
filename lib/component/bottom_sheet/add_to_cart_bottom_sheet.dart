import 'package:flutter/material.dart';
import 'package:my_theme/component/bottom_sheet/custom_bottom_sheet.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_expansion_tile.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

/// Add To Cart Bottom Sheet
addToCartBottomSheet(BuildContext context) {
  return customBottomSheet(
    context: context,
    title: 'Select Size',
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200.v, // İstediğiniz yüksekliği belirleyin
          child: GridView.builder(
            itemCount: 5,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 22,
              mainAxisSpacing: 16,
              crossAxisCount: 3,
              childAspectRatio: 5 / 2,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: .4, color: AppColors.greyColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text('M'),
                ),
              );
            },
          ),
        ),
        const CustomExpansionTile(title: 'Size info'),
        SizedBox(height: 28.h),
        CustomElevatedButton(
          onPressed: () {},
          text: 'SAVE PASSWORD',
        ),
      ],
    ),
  );
}
