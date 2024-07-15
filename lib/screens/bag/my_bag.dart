import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/bag/bag_card.dart';
import 'package:my_theme/component/bag/promo_card.dart';
import 'package:my_theme/component/bag/promo_code_input_field.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_sliver_appbar.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class MyBagView extends StatefulWidget {
  const MyBagView({super.key});

  @override
  State<MyBagView> createState() => _MyBagViewState();
}

class _MyBagViewState extends State<MyBagView> {
  final TextEditingController _promoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _buildBody(context),
      ),
    );
  }

  NestedScrollView _buildBody(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar()];
      },
      body: Padding(
        padding: EdgeInsets.all(16.h),
        child: ListView(
          children: [
            /// Bag items list
            _bagItemsList(),
            SizedBox(height: 24.h),

            /// Promo code text input field
            _promoCodeInput(context),
            SizedBox(height: 24.h),

            /// Total amount info
            _totalAmount(),
            SizedBox(height: 24.h),

            /// Check out button
            _checkOutButton(),
          ],
        ),
      ),
    );
  }

  /// Check out button
  Widget _checkOutButton() {
    return CustomElevatedButton(
      onPressed: () {},
      text: 'CHECK OUT',
    );
  }

  /// Total amount info
  Widget _totalAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: 'Total amount:',
          fontSize: 14.fSize,
          color: AppColors.greyColor,
        ),
        CustomText(
          text: '112\$',
          fontSize: 18.fSize,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }

  /// Promo code text input field
  Widget _promoCodeInput(BuildContext context) {
    return PromoCodeInputField(
      readOnly: true,
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: AppColors.backgroundColor,
          context: context,
          builder: (BuildContext context) {
            return _buildPromoCodeBottomSheet();
          },
        );
      },
    );
  }

  /// Bag items list
  Widget _bagItemsList() {
    return ListView.separated(
      itemCount: 3,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(height: 24.v),
      itemBuilder: (BuildContext context, int index) {
        return BagCard(
          onTap: () {
            context.goNamed('${AppRouteName.productDetail.name}_bag');
          },
        );
      },
    );
  }

  /// Sliver Appbar
  CustomSliverAppbar _buildAppbar() {
    return CustomSliverAppbar(
      title: 'My Bag',
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgSearch,
        ),
      ],
    );
  }

  Widget _buildPromoCodeBottomSheet() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 6,
            margin: const EdgeInsets.only(top: 16.0),
            decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(6.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: PromoCodeInputField(controller: _promoController),
          ),
          const Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'Your Promo Codes',
              style: TextStyle(fontSize: 18, color: AppColors.blackColor, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 10,
              padding: const EdgeInsets.only(top: 18),
              separatorBuilder: (context, index) => const SizedBox(height: 24),
              itemBuilder: (BuildContext context, int index) {
                return PromoCard(
                  applyOnPressed: () {
                    setState(() {
                      _promoController.text = 'mypromocode2024';
                    });
                  },
                  imagePath: 'assets/png/discount.png',
                  promoTitle: 'Personal offer',
                  promoCode: 'mypromocode2024',
                  remainingTime: '6 days remaining',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
