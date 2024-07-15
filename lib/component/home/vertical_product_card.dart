import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class VerticalProductCard extends StatefulWidget {
  const VerticalProductCard({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<VerticalProductCard> createState() => _VerticalProductCardState();
}

class _VerticalProductCardState extends State<VerticalProductCard> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 270.v,
      width: 148.h,
      color: AppColors.backgroundColor,
      onTap: widget.onTap,
      child: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset('assets/png/product.png', width: 148.h, height: 186.v, fit: BoxFit.cover),
              ),
              SizedBox(height: 5.v),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        _buildStars(lenght: 5),
                        const CustomText(
                          text: '(10)',
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.greyColor,
                        ),
                      ],
                    ),
                    SizedBox(height: 2.v),
                    const CustomText(
                      text: 'Dorothy Perkins',
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    ),
                    SizedBox(height: 2.v),
                    const CustomText(
                      text: 'Evening Dress',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: '15\$',
                          fontSize: 14,
                          color: AppColors.greyColor,
                          decoration: TextDecoration.lineThrough,
                        ),
                        SizedBox(width: 4.h),
                        const CustomText(
                          text: '12\$',
                          fontSize: 14,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          _topLabel(),
          _favoriteButton(),
        ],
      ),
    );
  }

  /// New or discount label
  Widget _topLabel() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: 40.h,
        height: 24.v,
        decoration: BoxDecoration(
            color: AppColors.blackColor,
            borderRadius: BorderRadius.circular(
              28,
            )),
        child: const Center(
          child: CustomText(
            text: 'NEW',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Favorite Button
  Widget _favoriteButton() {
    return Positioned(
      right: 0,
      bottom: 70.v,
      child: Material(
        elevation: 2,
        shape: const CircleBorder(),
        child: CustomIconButton(
          backgroundColor: Colors.white,
          iconSize: 16,
          iconColor: Colors.grey,
          onPressed: () {},
          icon: Assets.zaraSvgFavOutlined,
        ),
      ),
    );
  }

  Widget _buildStars({required int lenght}) {
    return Row(
      children: List.generate(lenght, (index) {
        return Icon(Icons.star_outlined, color: AppColors.starColor, size: 14.h);
      }),
    );
  }
}
