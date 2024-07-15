import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class OrderDetailCard extends StatelessWidget {
  const OrderDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        children: [
          SizedBox(
            width: 104.adaptSize,
            height: 104.adaptSize,
            child: Image.asset('assets/png/pullover.png', fit: BoxFit.fill),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Pullover',
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(width: 4.v),
                  CustomText(
                    text: 'Mango',
                    fontSize: 11.fSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                  SizedBox(width: 6.v),
                  Row(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Color: ',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                          CustomText(
                            text: 'Gray',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      SizedBox(width: 16.h),
                      Row(
                        children: [
                          CustomText(
                            text: 'Size: ',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                          CustomText(
                            text: 'L',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: 'Units: ',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                          CustomText(
                            text: '1',
                            fontSize: 11.fSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                      CustomText(
                        text: '51\$',
                        fontSize: 14.fSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
