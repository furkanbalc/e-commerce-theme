import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class AddingShippingAddressView extends StatefulWidget {
  const AddingShippingAddressView({super.key});

  @override
  State<AddingShippingAddressView> createState() => _AddingShippingAddressViewState();
}

class _AddingShippingAddressViewState extends State<AddingShippingAddressView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  /// Input Form Fields
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextFormField(
                label: 'Full name',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.v),
              const CustomTextFormField(
                label: 'Address',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.v),
              const CustomTextFormField(
                label: 'City',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.v),
              const CustomTextFormField(
                label: 'State/Province/Region',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.v),
              const CustomTextFormField(
                label: 'Zip Code (Postal Code)',
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 20.v),
              CustomTextFormField(
                label: 'Country',
                readOnly: true,
                textInputAction: TextInputAction.done,
                suffixIcon: Icon(
                  Icons.chevron_right,
                  size: 16.adaptSize,
                  color: AppColors.blackColor,
                ),
                onTap: () {},
              ),
              SizedBox(height: 40.v),
              _getSaveAddressButton(),
            ],
          ),
        ),
      ),
    );
  }

  /// Appbar
  CustomAppBar buildAppbar() {
    return const CustomAppBar(
      title: 'Adding Shipping Address',
      backgroundColor: Colors.white,
      shadowColor: AppColors.blackColor,
      elevation: 1,
      arrowBack: true,
    );
  }

  /// Save address button
  Widget _getSaveAddressButton() {
    return CustomElevatedButton(
      onPressed: () {},
      buttonWidth: double.infinity,
      text: 'SAVE ADDRESS',
    );
  }
}
