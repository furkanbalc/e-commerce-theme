import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class PromoCard extends StatefulWidget {
  const PromoCard({
    super.key,
    required this.imagePath,
    required this.promoTitle,
    required this.promoCode,
    required this.remainingTime,
    required this.applyOnPressed,
  });

  final VoidCallback applyOnPressed;
  final String imagePath;
  final String promoTitle;
  final String promoCode;
  final String remainingTime;

  @override
  State<PromoCard> createState() => _PromoCardState();
}

class _PromoCardState extends State<PromoCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 80.h,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              width: 80.v,
              height: 80.h,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
              child: Image.asset(widget.imagePath),
            ),
            SizedBox(width: 14.v),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Promo title & desc
                  _promoTitleDesc(),

                  /// Promo date & apply button
                  _promoDateApply(),
                ],
              ),
            ),
            SizedBox(width: 14.v),
          ],
        ),
      ),
    );
  }

  /// Promo date & apply button
  Widget _promoDateApply() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomText(text: widget.remainingTime, fontSize: 11.fSize, color: AppColors.greyColor, fontWeight: FontWeight.w400),
        CustomElevatedButton(
          buttonWidth: 93.v,
          buttonHeight: 36.h,
          padding: EdgeInsets.zero,
          onPressed: () {},
          text: 'Apply',
        ),
      ],
    );
  }

  /// Promo title & desc
  Widget _promoTitleDesc() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: widget.promoTitle, fontSize: 14.fSize, color: AppColors.blackColor),
        CustomText(text: widget.promoCode, fontSize: 11.fSize, color: AppColors.blackColor, fontWeight: FontWeight.w400),
      ],
    );
  }
}
