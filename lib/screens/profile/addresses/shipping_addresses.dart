import 'package:flutter/material.dart';
import 'package:my_theme/component/address/address_card.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/profile/addresses/adding_shipping_address.dart';

class ShippingAddressesView extends StatefulWidget {
  const ShippingAddressesView({super.key});

  @override
  State<ShippingAddressesView> createState() => _ShippingAddressesViewState();
}

class _ShippingAddressesViewState extends State<ShippingAddressesView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        floatingActionButton: _buildAddAddressButton(context),
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  /// Appbar
  CustomAppBar _buildAppbar() {
    return const CustomAppBar(
      elevation: 1,
      shadowColor: AppColors.blackColor,
      centerTitle: true,
      backgroundColor: Colors.white,
      title: 'Shipping Addresses',
      arrowBack: true,
    );
  }

  /// Addresses List
  Widget _buildBody() {
    return ListView.separated(
      itemCount: 5,
      padding: EdgeInsets.all(16.v),
      separatorBuilder: (context, index) => SizedBox(height: 24.h),
      itemBuilder: (BuildContext context, int index) {
        return const AddressCard(
          name: 'Jane Doe',
          addressTitle: '3 Newbridge Court',
          desc: 'Chino Hilss, CA 91709 United States',
        );
      },
    );
  }

  /// Add Address Button
  Widget _buildAddAddressButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddingShippingAddressView()));
      },
      backgroundColor: AppColors.blackColor,
      shape: const CircleBorder(),
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
