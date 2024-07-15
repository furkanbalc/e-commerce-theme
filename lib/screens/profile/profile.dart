import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_page_title_widget.dart';
import 'package:my_theme/component/custom_sliver_appbar.dart';
import 'package:my_theme/component/profile/profile_items_card.dart';
import 'package:my_theme/component/profile/profile_user_info_widget.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/profile/addresses/shipping_addresses.dart';
import 'package:my_theme/screens/profile/my_orders/my_orders.dart';
import 'package:my_theme/screens/profile/settings/settings.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _buildBody(context),
      ),
    );
  }

  /// Sliver Appbar
  CustomSliverAppbar _buildAppbar() {
    return CustomSliverAppbar(
      title: 'My Profile',
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgSearch,
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar()];
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// User Profil Photo & User Name & Email
          _userInfoWidget(),
          SizedBox(height: 16.v),

          /// Profile Items List
          _profileItemList(context),
        ],
      ),
    );
  }

  /// User Profil Photo & User Name & Email
  Widget _userInfoWidget() {
    return const UserInfoWidget(
      photoUrl: 'assets/png/profile.png',
      name: 'Matilda Brown',
      email: 'matildabrown@mail.com',
    );
  }

  /// Profile Items List
  Widget _profileItemList(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ProfileItemsCard(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyOrdersView()),
                );
              },
              title: 'My Orders',
              subTitle: 'Already have 12 orders'),
          _buildDivider(),
          ProfileItemsCard(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ShippingAddressesView()),
              );
            },
            title: 'Shipping Addresses',
            subTitle: '3 addresses',
          ),
          _buildDivider(),
          ProfileItemsCard(onPressed: () {}, title: 'Payment Methods', subTitle: 'Visa **34'),
          _buildDivider(),
          ProfileItemsCard(onPressed: () {}, title: 'Promocodes', subTitle: 'You have special promocodes'),
          _buildDivider(),
          ProfileItemsCard(onPressed: () {}, title: 'My Reviews', subTitle: 'Reviews for 4 items'),
          _buildDivider(),
          ProfileItemsCard(
            onPressed: () {
              context.goNamed(AppRouteName.settings.name);
            },
            title: 'Settings',
            subTitle: 'Notifications, password',
          ),
        ],
      ),
    );
  }

  /// Divider
  Widget _buildDivider() => const Divider(color: AppColors.greyColor, thickness: .2);
}
