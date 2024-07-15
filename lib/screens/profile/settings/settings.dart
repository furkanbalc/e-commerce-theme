import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/bottom_sheet/change_password_bottom_sheet.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_sliver_appbar.dart';
import 'package:my_theme/component/custom_switch_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/custom_text_form_field.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _ThemeZaraSettingPageState();
}

class _ThemeZaraSettingPageState extends State<SettingsView> {
  final TextEditingController _password = TextEditingController(text: 'passwordtext');
  final TextEditingController _date = TextEditingController(text: '12/12/1999');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _buildBody(),
      ),
    );
  }

  /// Sliver Appbar
  CustomSliverAppbar _buildAppbar(BuildContext context) {
    return CustomSliverAppbar(
      title: 'Settings',
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgSearch,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar(context)];
      },
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Personal information full name & date of birth
                  _personalInformation(),
                  SizedBox(height: 54.h),

                  /// Change password widget
                  _changePassword(),
                  SizedBox(height: 55.h),

                  /// Notifications settings
                  _notifications(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Personal information full name & date of birth
  Widget _personalInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text: 'Personal Information', fontSize: 16, fontWeight: FontWeight.w600),
        SizedBox(height: 21.h),
        const CustomTextFormField(label: 'Full name'),
        SizedBox(height: 24.h),
        CustomTextFormField(controller: _date, label: 'Date of Birth'),
      ],
    );
  }

  /// Change password widget
  Widget _changePassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomText(text: 'Password', fontSize: 16, fontWeight: FontWeight.w600),
            TextButton(
              onPressed: () {
                /// Change Password Bottom Sheet
                changePasswordBottomSheet(context);
              },
              child: const CustomText(text: 'Change', fontSize: 14, color: AppColors.greyColor),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        CustomTextFormField(controller: _password, label: 'Password', obscureText: true),
      ],
    );
  }

  /// Notifications settings
  Widget _notifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText(text: 'Notifications', fontSize: 16, fontWeight: FontWeight.w600),
        SizedBox(height: 16.h),
        CustomSwitchButton(
          value: true,
          onChanged: (value) {},
          title: 'Sales',
        ),
        SizedBox(height: 16.h),
        CustomSwitchButton(
          value: false,
          onChanged: (value) {},
          title: 'New arrivals',
        ),
        SizedBox(height: 16.h),
        CustomSwitchButton(
          value: false,
          onChanged: (value) {},
          title: 'Delivery status changes',
        ),
      ],
    );
  }
}
