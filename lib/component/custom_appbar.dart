import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/assets.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.arrowBack,
    this.backgroundColor,
    this.elevation,
    this.centerTitle,
    this.shadowColor,
  });

  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final bool? arrowBack;
  final bool? centerTitle;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? kToolbarHeight.h : kToolbarHeight * 2.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: widget.elevation,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.transparent,
      shadowColor: widget.shadowColor,
      centerTitle: widget.centerTitle ?? true,
      backgroundColor: widget.backgroundColor ?? AppColors.backgroundColor,
      title: CustomText(
        text: widget.title ?? '',
        fontSize: 18.fSize,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      leading: widget.arrowBack ?? false ? _arrowBackIcon() : widget.leading,
      actions: widget.actions,
      actionsIconTheme: IconThemeData(
        size: 20.adaptSize,
      ),
      bottom: widget.bottom,
    );
  }

  Widget _arrowBackIcon() {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: SvgPicture.asset(Assets.zaraSvgArrowLeft,width: 24.adaptSize,height: 24.adaptSize),
    );
  }

}
