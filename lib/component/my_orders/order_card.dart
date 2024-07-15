import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/profile/my_orders/order_details.dart';

enum OrderStatus { delivered, processing, cancelled }

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.orderNo,
    required this.trackingNo,
    required this.quantity,
    required this.totalAmount,
    required this.date,
    required this.orderStatus,
  });

  final String orderNo;
  final String trackingNo;
  final String quantity;
  final String totalAmount;
  final String date;
  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 164.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomText(
                  text: "Order №$orderNo",
                  fontSize: 16.fSize,
                  fontWeight: FontWeight.w600,
                ),
                CustomText(
                  text: date,
                  fontSize: 14.fSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
              ],
            ),
            SizedBox(height: 8.v),
            Row(
              mainAxisSize: MainAxisSize.max,
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
                    text: trackingNo,
                    fontSize: 14.fSize,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomText(
                    text: "Quantity:",
                    fontSize: 14.fSize,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomText(
                    text: quantity,
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                CustomText(
                  text: "Total Amount:",
                  fontSize: 14.fSize,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.h),
                  child: CustomText(
                    text: "$totalAmount\$",
                    fontSize: 16.fSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.v),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: 98.v,
                  height: 36.h,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderDetailView()));
                    },
                    child: CustomText(text: 'Details', fontSize: 14.fSize, color: AppColors.blackColor),
                  ),
                ),
                _buildOrderStatusText(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatusText() {
    switch (orderStatus) {
      case OrderStatus.delivered:
        return CustomText(text: 'Delivered', fontSize: 14.fSize, color: Colors.green);
      case OrderStatus.processing:
        return CustomText(text: 'Processing', fontSize: 14.fSize, color: Colors.blue);
      case OrderStatus.cancelled:
        return CustomText(text: 'Cancelled', fontSize: 14.fSize, color: Colors.red);
      default:
        return CustomText(text: 'Unknown status', fontSize: 14.fSize, color: Colors.grey);
    }
  }
}
