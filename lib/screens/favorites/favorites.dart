import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_sliver_appbar.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/home/vertical_product_card.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

// class FavoritesView extends StatefulWidget {
//   const FavoritesView({super.key});
//
//   @override
//   State<FavoritesView> createState() => _FavoritesViewState();
// }
//
// class _FavoritesViewState extends State<FavoritesView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body:
//         NestedScrollView(
//           headerSliverBuilder: (context, innerBoxIsScrolled) {
//             return [_buildAppbar()];
//           },
//           body: Padding(
//             padding: EdgeInsets.all(16.h),
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// Sliver Appbar
//   CustomSliverAppbar _buildAppbar() {
//     return CustomSliverAppbar(
//       title: 'Favorites',
//       actions: [
//         CustomIconButton(
//           onPressed: () {},
//           icon: Assets.zaraSvgSearch,
//         ),
//       ],
//       bottom: Column(
//         children: [
//           SizedBox(
//             height: 30.v,
//             child: ListView.separated(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 return CustomElevatedButton(
//                   buttonHeight: 30.v,
//                   buttonWidth: 100.h,
//                   onPressed: () {},
//                   text: 'T-Shirt',
//                 );
//               },
//               separatorBuilder: (context, index) => SizedBox(width: 12.h),
//               itemCount: 10,
//             ),
//           ),
//         ],
//       ),
//       bottomHeight: 96.v,
//     );
//   }
// }
class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: CustomScrollView(
            slivers: [
              _buildSliverAppBar(),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 224.0.v,
      backgroundColor: AppColors.backgroundColor,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.adaptSize),
        child: _buildFilterComponent(),
      ),
    );
  }

  ///appbar'ın altındaki filtreleme yapmak için kullanılan araçlar
  Widget _buildFilterComponent() {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 14.h,
            ),
            CustomText(
              text: 'Favorites',
              fontSize: 24.fSize,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: AppColors.blackColor),
              onPressed: () {},
              iconSize: 24.adaptSize,
            ),
          ],
        ),
        SizedBox(
          height: 30.v,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  CustomElevatedButton(
                    onPressed: () {},
                    text: 'Summer',
                    backgroundColor: AppColors.blackColor,
                    textColor: AppColors.whiteTextColor,
                    buttonWidth: 100.adaptSize,
                    buttonHeight: 30.adaptSize,
                    padding: EdgeInsets.zero,
                    fontSize: 14.fSize,
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 12.h,
              );
            },
            itemCount: 6,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Padding(
                padding: EdgeInsets.only(left: 16.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.filter_list,
                      color: AppColors.blackColor,
                      size: 24.adaptSize,
                    ),
                    CustomText(
                      text: 'Filters',
                      color: AppColors.blackColor,
                      fontSize: 11.fSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.swap_vert,
                  color: AppColors.blackColor,
                  size: 24.adaptSize,
                ),
                CustomText(
                  text: 'Price: lowest to high',
                  color: AppColors.blackColor,
                  fontSize: 11.fSize,
                  fontWeight: FontWeight.normal,
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: Icon(isGrid ? Icons.grid_view_rounded : Icons.list),
              iconSize: 24.adaptSize,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8.h),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.v),
              child: isGrid
                  ?  VerticalProductCard(onTap: () {  },
              )
                  :  VerticalProductCard(
                onTap: () {

                },
              ),
            );
          },
          childCount: 12,
        ),
      ),
    );
  }

  ///filtre butonuna tıklayınca açılan bottom sheet
  Widget _filterBottomSheet() {
    return Container(
      padding: EdgeInsets.all(16.0.adaptSize),
      height: 250.0.v,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filters',
            style: TextStyle(
              fontSize: 24.0.fSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Filtreleme seçeneklerinizi buraya ekleyin
          ListTile(
            title: const Text('Option 1'),
            trailing: Checkbox(
              value: true,
              onChanged: (bool? value) {},
            ),
          ),
          ListTile(
            title: const Text('Option 2'),
            trailing: Checkbox(
              value: false,
              onChanged: (bool? value) {},
            ),
          ),
        ],
      ),
    );
  }
}
