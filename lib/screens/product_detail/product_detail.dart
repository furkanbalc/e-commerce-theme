import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/bottom_sheet/add_to_cart_bottom_sheet.dart';
import 'package:my_theme/component/custom_appbar.dart';
import 'package:my_theme/component/custom_elevated_button.dart';
import 'package:my_theme/component/custom_expansion_tile.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/home/vertical_product_card.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class ProductDetailView extends StatefulWidget {
  const ProductDetailView({super.key});

  @override
  State<ProductDetailView> createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: _buildAppbar(),
        body: _buildBody(),
        floatingActionButton: _addToCartButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _imageGallery(),
          Padding(
            padding: EdgeInsets.all(16.h),
            child: Column(
              children: [
                /// Select Size & Color and Favorite button
                _selectProductVariant(),
                SizedBox(height: 22.v),

                /// Product description
                _productDescription(),

                SizedBox(height: 20.v),

                /// Expansion tile product detail list
                _buildExpansionTileList(),
                SizedBox(height: 24.v),

                /// You can also like this horizontal list widget
                _youCanAlsoLikeThisList(),
                SizedBox(height: 106.v),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// You can also like this horizontal list widget
  Widget _youCanAlsoLikeThisList() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: 'You can also like this', fontSize: 18, fontWeight: FontWeight.w600),
            CustomText(text: '12 items', fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.greyColor),
          ],
        ),
        SizedBox(height: 16.v),
        SizedBox(
          height: 270.v,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.h),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return VerticalProductCard(
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => SizedBox(width: 16.h),
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  /// Product detail expansion tile list
  Column _buildExpansionTileList() {
    return Column(
      children: [
        Divider(height: .4, color: AppColors.greyColor.withOpacity(.2)),
        const CustomExpansionTile(title: 'Item details'),
        Divider(height: .4, color: AppColors.greyColor.withOpacity(.2)),
        const CustomExpansionTile(title: 'Shipping info'),
        Divider(height: .4, color: AppColors.greyColor.withOpacity(.2)),
        const CustomExpansionTile(title: 'Support'),
        Divider(height: .4, color: AppColors.greyColor.withOpacity(.2)),
      ],
    );
  }

  /// Product description
  Widget _productDescription() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(text: 'H&M', fontSize: 24, fontWeight: FontWeight.w600),
                const CustomText(
                  text: 'Short black dress',
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyColor,
                ),
                SizedBox(height: 8.v),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star_outlined, color: AppColors.starColor, size: 18.h);
                      }),
                    ),
                    const CustomText(
                      text: '(10)',
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    ),
                  ],
                ),
              ],
            ),
            const CustomText(text: '\$19.99', fontSize: 24, fontWeight: FontWeight.w600),
          ],
        ),
        SizedBox(height: 16.v),
        const CustomText(
          text:
              'Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }

  /// Select Size & Color and Favorite button
  Widget _selectProductVariant() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDropDown(title: 'Size'),
        _buildDropDown(title: 'Color'),
        _favoriteButton(),
      ],
    );
  }

  /// Image Gallery widget
  Widget _imageGallery() {
    return SizedBox(
      height: 413.v,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset('assets/png/dress1.png', fit: BoxFit.cover),
          Image.asset('assets/png/dress2.png', fit: BoxFit.cover),
        ],
      ),
    );
  }

  /// Add To Cart Button
  Widget _addToCartButton() {
    return Container(
      height: 80.v,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.all(16.h),
      child: CustomElevatedButton(
        buttonHeight: 48.v,
        onPressed: () {
          addToCartBottomSheet(context);
        },
        text: 'ADD TO CART',
      ),
    );
  }

  /// Appbar
  CustomAppBar _buildAppbar() {
    return CustomAppBar(
      elevation: 1,
      shadowColor: AppColors.blackColor,
      arrowBack: true,
      title: 'Short dress',
      actions: [
        CustomIconButton(
          onPressed: () {},
          icon: Assets.zaraSvgShare,
        ),
      ],
    );
  }

  /// Favorite button
  Widget _favoriteButton() {
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        onPressed: () {
          setState(() {
            isFav = !isFav;
          });
        },
        icon: SvgPicture.asset(isFav ? Assets.zaraSvgFavoritesFilled : Assets.zaraSvgFavoritesOutlined),
        style: IconButton.styleFrom(
          backgroundColor: Colors.white,
          shadowColor: AppColors.greyColor,
          elevation: 3,
        ),
      ),
    );
  }

  /// Drop down button
  Widget _buildDropDown({required String title}) {
    return Container(
      width: 138.h,
      height: 40.v,
      padding: EdgeInsets.symmetric(vertical: 10.v, horizontal: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(strokeAlign: .4, color: AppColors.greyColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: title, fontSize: 14),
          Icon(Icons.keyboard_arrow_down_outlined, size: 16.adaptSize),
        ],
      ),
    );
  }
}
