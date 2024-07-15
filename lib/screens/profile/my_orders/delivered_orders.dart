import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_theme/component/my_orders/order_card.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class DeliveredOrders extends StatefulWidget {
  const DeliveredOrders({super.key});

  @override
  State<DeliveredOrders> createState() => _DeliveredOrdersState();
}

class _DeliveredOrdersState extends State<DeliveredOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.v),
        Expanded(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.h),
            child: ListView.separated(
              itemCount: 5,
              separatorBuilder: (context, index) => SizedBox(height: 24.v),
              itemBuilder: (BuildContext context, int index) {
                return const OrderCard(
                  orderNo: '1947034',
                  date: '05-12-2019',
                  trackingNo: 'IW3475453455',
                  quantity: '3',
                  totalAmount: '112',
                  orderStatus: OrderStatus.delivered,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
