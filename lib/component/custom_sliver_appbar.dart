import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottomHeight,
    this.appbarHeight,
    this.bottom,
  });

  final String? title;
  final Widget? leading;
  final Widget? bottom;
  final double? bottomHeight;
  final double? appbarHeight;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: false,
      backgroundColor: Colors.white,
      expandedHeight:appbarHeight ??  140.h,
      elevation: 1,
      surfaceTintColor: Colors.white,
      shadowColor: AppColors.blackColor,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool isExpanded = constraints.biggest.height > 86.v;
          return FlexibleSpaceBar(
            background: Container(color: AppColors.backgroundColor),
            titlePadding: EdgeInsets.only(bottom: 16.v, left: isExpanded ? 16.v : 0),
            centerTitle: !isExpanded,
            title: CustomText(
              text: title ?? '',
              fontSize: isExpanded ? 24.fSize : 18.fSize,
              fontWeight: isExpanded ? FontWeight.bold : FontWeight.w600,
              color: AppColors.blackColor,
            ),
          );
        },
      ),
      leading: leading,
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(bottomHeight ?? 0),
              child: bottom!,
            )
          : null,
    );
  }
}
