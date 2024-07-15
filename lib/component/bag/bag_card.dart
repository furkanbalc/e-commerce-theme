import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class BagCard extends StatefulWidget {
  const BagCard({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  int _itemCount = 1;

  void _incrementCount() {
    setState(() {
      _itemCount++;
    });
  }

  void _decrementCount() {
    if (_itemCount != 0) {
      setState(() {
        _itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 104.h,
      onTap: widget.onTap,
      child: Stack(
        children: [
          Row(
            children: [
              SizedBox(
                width: 104.adaptSize,
                height: 104.adaptSize,
                child: Image.asset('assets/png/pullover.png', fit: BoxFit.fill),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.v),
                  /// Product Info Name & Color & Size & Price & Count
                  child: _getProductInfo(),
                ),
              ),
            ],
          ),
          _getMoreIcon(),
        ],
      ),
    );
  }

  /// Product Info Name & Color & Size & Price & Count
  Widget _getProductInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Pullover',
          fontSize: 16.fSize,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(width: 4.v),
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
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _getProductCountWidget(),
            CustomText(
              text: '51\$',
              fontSize: 14.fSize,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ],
    );
  }

  /// Product Count & Minus - Plus Buttons
  Widget _getProductCountWidget() {
    return SizedBox(
      width: 110.v,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconButton(
            onPressed: _decrementCount,
            iconPath: 'assets/svg/minus.svg',
          ),
          CustomText(text: '$_itemCount', fontSize: 14.fSize),
          _buildIconButton(
            onPressed: _incrementCount,
            iconPath: 'assets/svg/plus.svg',
          ),
        ],
      ),
    );
  }

  /// More Icon
  Widget _getMoreIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: AppColors.greyColor,
        elevation: 3,
        offset: const Offset(-50, -25),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              child: Center(
                child: CustomText(
                  text: 'Add to Favorites',
                  fontSize: 12.fSize,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            PopupMenuItem(
              child: Center(
                child: CustomText(
                  text: 'Delete from the list',
                  fontSize: 12.fSize,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ];
        },
        icon: SvgPicture.asset('assets/svg/more.svg'),
      ),
    );
  }

  Widget _buildIconButton({required Function() onPressed, required String iconPath}) {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(iconPath),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: AppColors.greyColor,
          elevation: 3,
        ),
      ),
    );
  }
}
