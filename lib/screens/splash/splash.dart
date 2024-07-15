import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_theme/bottom/app.dart';
import 'package:my_theme/constants/color.dart';
import 'package:my_theme/core/router/route_names.dart';
import 'package:shimmer/shimmer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Durations.extralong4 * 2).then(
     (value) => context.goNamed(AppRouteName.home.name),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Shimmer.fromColors(
      baseColor: AppColors.blackColor,
      highlightColor: Colors.white,
      child: Center(
        child: Image.asset(
          'assets/png/app-logo.png',
          width: MediaQuery.sizeOf(context).width * .6,
        ),
      ),
    );
  }
}
