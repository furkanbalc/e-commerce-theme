import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({super.key});

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool _like = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(12.h),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(24.v),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                /// Comment's user name & rating & date
                _buildCommentTitle(),
                SizedBox(height: 11.v),

                /// Comment text
                _buildCommentText(),

                SizedBox(height: 8.v),

                /// Comments images list
                _buildCommentImageList(),
                SizedBox(height: 8.v),

                /// Like button
                _likeButton(),
              ],
            ),
          ),
        ),

        /// Comment's user profil photo
        _commentUserProfilePhoto(),
      ],
    );
  }

  /// Comments images list
  Widget _buildCommentImageList() {
    return SizedBox(
      height: 105.h,
      child: ListView.separated(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 16.h),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 104.adaptSize,
            height: 104.adaptSize,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/png/comment-image.png')),
            ),
          );
        },
      ),
    );
  }

  /// Like button
  Widget _likeButton() {
    return InkWell(
      onTap: () {
        setState(() {
          _like = !_like;
        });
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomText(
              text: 'Helpful',
              fontSize: 11.fSize,
              fontWeight: FontWeight.w400,
              color: _like ? AppColors.greyColor : Colors.blue,
            ),
            SizedBox(width: 4.h),
            SvgPicture.asset(
              Assets.zaraSvgLike,
              colorFilter: ColorFilter.mode(
                _like ? AppColors.greyColor : Colors.blue,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Comment's user profil photo
  Widget _commentUserProfilePhoto() {
    return Container(
      width: 32.adaptSize,
      height: 32.adaptSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/png/rating-profile-photo.png'),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyColor,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
    );
  }

  /// Comment's user name & rating & date
  Widget _buildCommentTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            CustomText(text: 'Helene Moore', fontSize: 14.fSize, fontWeight: FontWeight.w600),
            _buildStars(lenght: 5),
          ],
        ),
        CustomText(
          text: 'July 5, 2024',
          fontSize: 11.fSize,
          fontWeight: FontWeight.w400,
          color: AppColors.greyColor,
        ),
      ],
    );
  }

  /// Comment text
  Widget _buildCommentText() {
    return CustomText(
      text:
          'The dress is great! Very classy and comfortable. It fit perfectly! I\'m 5\'7" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn\'t recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well',
      fontSize: 14.fSize,
      fontWeight: FontWeight.w400,
    );
  }

  Widget _buildStars({required int lenght}) {
    return Row(
      children: List.generate(lenght, (index) {
        return Icon(Icons.star_outlined, color: AppColors.starColor, size: 18.h);
      }),
    );
  }
}
