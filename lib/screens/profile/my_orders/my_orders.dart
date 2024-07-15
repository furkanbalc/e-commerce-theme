import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_page_title_widget.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/profile/my_orders/cancelled_orders.dart';
import 'package:my_theme/screens/profile/my_orders/delivered_orders.dart';
import 'package:my_theme/screens/profile/my_orders/processing_orders.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: _buildAppbar(),
        body: _buildBody(),
      ),
    );
  }

  /// Appbar
  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      arrowBack: true,
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgSearch,
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _pageTitle(),
        SizedBox(height: 22.v), // Boşluk için eklendi
        /// Tabbar Widget
        _buildTabbar(),

        /// Tabbar Views
        _buildTabbarViews(),
      ],
    );
  }

  /// My Orders Page title
  Widget _pageTitle() {
    return const CustomPageTitleWidget(pageTitle: 'My Orders');
  }

  /// Tabbar Widget
  Widget _buildTabbar() {
    return TabBar(
      splashFactory: NoSplash.splashFactory,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      dividerHeight: 0,
      controller: _tabController,
      labelPadding: EdgeInsets.zero,
      labelColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 14.fSize,
        fontFamily: 'Metropolis',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.fSize,
        fontFamily: 'Metropolis',
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        color: AppColors.blackColor,
        borderRadius: BorderRadius.circular(29),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.v),
      tabs: const [
        Tab(text: 'Delivered'),
        Tab(text: 'Processing'),
        Tab(text: 'Cancelled'),
      ],
    );
  }

  /// Tabbar Views
  Widget _buildTabbarViews() {
    return Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: const [
          DeliveredOrders(),
          ProcessingOrders(),
          CancelledOrders(),
        ],
      ),
    );
  }
}
