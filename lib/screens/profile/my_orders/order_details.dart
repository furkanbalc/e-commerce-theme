import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_svg_widget.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/my_orders/order_detail_card.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({super.key});

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: _buildAppbar(),
        body: _buildBody(context),
      ),
    );
  }

  Padding _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 30.v),
          _orderInformation(),
          SizedBox(height: 20.v),
          CustomText(text: '3 items', fontSize: 14.fSize),
          SizedBox(height: 20.v),
          _ordersList(context),
        ],
      ),
    );
  }

  Widget _ordersList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(height: 24.v),
            itemBuilder: (BuildContext context, int index) {
              return const OrderDetailCard();
            },
          ),
          SizedBox(height: 24.h),
          _orderInformationSection(),
          SizedBox(height: 24.h),
          _bottomButtons(context),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Row _bottomButtons(BuildContext context) {
    return Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 36.h,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetailView()));
                  },
                  child: CustomText(text: 'Details', fontSize: 14.fSize, color: AppColors.blackColor),
                ),
              ),
            ),
            SizedBox(width: 24.v),
            Expanded(
              child: SizedBox(
                height: 36.h,
                child: CustomElevatedButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetailView()));
                  },
                  text: 'Leave feedback',
                ),
              ),
            ),
          ],
        );
  }

  Column _orderInformationSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'Order information', fontSize: 14.fSize),
            SizedBox(height: 14.h),
            buildOrderInformation(
              title: 'Shipping Address',
              desc: '3 Newbridge Court, Chino Hills,\nCA 91709, United States',
            ),
            SizedBox(height: 24.v),
            buildOrderInformation(
              title: 'Payment method',
              desc: '**** **** **** 3947',
              icon: Assets.zaraSvgMasterCard,
            ),
            SizedBox(height: 24.v),
            buildOrderInformation(
              title: 'Delivery Address',
              desc: 'FedEx, 3 days, 15\$',
            ),
            SizedBox(height: 24.v),
            buildOrderInformation(
              title: 'Shipping Address',
              desc: '10%, Personal promo code',
            ),
            SizedBox(height: 24.v),
            buildOrderInformation(
              title: 'Total Amount',
              desc: '133\$',
            ),
          ],
        );
  }

  Column _orderInformation() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            CustomText(
              text: "Order №1947034",
              fontSize: 16.fSize,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: '05-12-2024',
              fontSize: 14.fSize,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor,
            ),
          ],
        ),
        SizedBox(height: 8.v),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomText(
                  text: "Tracking number:",
                  fontSize: 14.fSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomText(
                    text: 'IW3475453455',
                    fontSize: 14.fSize,
                  ),
                ),
              ],
            ),
            CustomText(text: 'Delivered', fontSize: 14.fSize, color: Colors.green),
          ],
        ),
      ],
    );
  }
  /// Appbar
  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      title: 'Order Details',
      backgroundColor: Colors.white,
      shadowColor: AppColors.blackColor,
      elevation: 1,
      arrowBack: true,
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgSearch,
        ),
      ],
    );
  }

  Widget buildOrderInformation({
    required String title,
    required String desc,
    String? icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: '$title:',
          fontSize: 14.fSize,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
        ),
        SizedBox(width: 10.v),
        icon != null
            ? Row(
                children: [
                  CustomSvgWidget(svg: icon),
                  SizedBox(width: 10.v),
                ],
              )
            : const SizedBox.shrink(),
        CustomText(
          text: desc,
          fontSize: 14.fSize,
          color: AppColors.blackColor,
        ),
      ],
    );
  }
}
