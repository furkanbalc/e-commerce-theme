import 'package:flutter/material.dart';
import 'package:my_theme/component/bottom_sheet/write_a_review_bottom_sheet.dart';
import 'package:my_theme/component/custom_checkbox_list_tile.dart';
import 'package:my_theme/component/custom_icon_button.dart';
import 'package:my_theme/component/custom_sliver_appbar.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/component/rating_reviews/rating_reviews.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class RatingReviewsView extends StatefulWidget {
  const RatingReviewsView({super.key});

  @override
  State<RatingReviewsView> createState() => _RatingReviewsViewState();
}

class _RatingReviewsViewState extends State<RatingReviewsView> {
  TextEditingController commentController = TextEditingController(
      text:
          'I’m super happy with these! I’ve never bought jeans online before and I didn’t think they’d even fit, but it turns out they fit pretty perfectly. I got a size 28- I’m 5’6” and weigh about 127 lbs. They are tight but not suffocating ...');
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: _buildBody(),
        floatingActionButton: _writeReviewButton(context),
      ),
    );
  }

  /// Write a review button
  Widget _writeReviewButton(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
      onPressed: () {
        writeReviewBottomSheet(context,commentController);
      },
      icon: Icon(Icons.edit, size: 18.adaptSize, color: Colors.white),
      label: CustomText(
        text: 'Write a review',
        fontSize: 11.fSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  NestedScrollView _buildBody() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [_buildAppbar()];
      },
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.h),
          child: Column(
            children: [
              /// Comments rating
              _commentRatings(),
              SizedBox(height: 33.v),

              /// Comments count
              _commentCount(),
              SizedBox(height: 16.v), // Daha iyi görünürlük için boşluk ekleyin
              /// Comments list
              _commentsCardList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Appbar
  CustomSliverAppbar _buildAppbar() {
    return CustomSliverAppbar(
      title: 'Rating&Reviews',
      leading: CustomIconButton(
        onPressed: () {},
        icon: Assets.zaraSvgArrowLeft,
      ),
    );
  }

  /// Comments list
  Widget _commentsCardList() {
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.v),
      itemBuilder: (context, index) {
        return const CommentCard();
      },
    );
  }

  /// Comments rating
  Widget _commentRatings() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CustomText(text: '4.3', fontSize: 44.fSize, fontWeight: FontWeight.w600),
            CustomText(
              text: '23 ratings',
              fontSize: 14.fSize,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(width: 28.h),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildRating(stars: 5, rating: 12),
              _buildRating(stars: 4, rating: 5),
              _buildRating(stars: 3, rating: 4),
              _buildRating(stars: 2, rating: 2),
              _buildRating(stars: 1, rating: 0),
            ],
          ),
        ),
      ],
    );
  }

  /// Comments count
  Widget _commentCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: '8 Reviews', fontSize: 24.fSize, fontWeight: FontWeight.w600),
        SizedBox(
          width: 150.h,
          child: CustomCheckBoxListTile(
            title: 'With photo',
            value: _isCheck,
            onChanged: (bool? value) {
              setState(() {
                _isCheck = value ?? false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStars({required int lenght}) {
    return Row(
      children: List.generate(lenght, (index) {
        return Icon(Icons.star_outlined, color: AppColors.starColor, size: 18.h);
      }),
    );
  }

  Widget _buildRating({required int stars, required double rating}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          child: _buildStars(lenght: stars),
        ),
        SizedBox(width: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 130,
              child: LinearProgressIndicator(
                minHeight: 8,
                value: rating / 23,
                color: AppColors.primaryColor,
                backgroundColor: Colors.transparent,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 16.h,
          child: CustomText(
            text: rating.toInt().toString(),
            fontSize: 14.fSize,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
