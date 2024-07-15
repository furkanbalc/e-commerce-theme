import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_checkbox_list_tile.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class AddressCard extends StatefulWidget {
  const AddressCard({
    super.key,
    required this.name,
    required this.addressTitle,
    required this.desc,
    this.isSelectedAddress = false,
  });

  final String name;
  final String addressTitle;
  final String desc;
  final bool? isSelectedAddress;

  @override
  State<AddressCard> createState() => _AddressCardState();
}

class _AddressCardState extends State<AddressCard> {
  @override
  void initState() {
    _isChecked = widget.isSelectedAddress ?? false;
    super.initState();
  }

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      height: 150.h,
      child: Container(
        padding: EdgeInsets.fromLTRB(24.h, 16.v, 24.h, 0),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: widget.name,
                  fontSize: 14.fSize,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 7.h),
                CustomText(
                  text: widget.addressTitle,
                  fontSize: 14.fSize,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                ),
                CustomText(
                  text: widget.desc,
                  fontSize: 14.fSize,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w400,
                ),
                CustomCheckBoxListTile(
                  title: 'Use as the shipping address',
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {},
                child: CustomText(
                  text: 'Edit',
                  fontSize: 14.fSize,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
