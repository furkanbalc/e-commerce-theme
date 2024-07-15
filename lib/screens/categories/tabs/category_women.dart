import 'package:flutter/material.dart';
import 'package:my_theme/component/categories/campaign_card.dart';
import 'package:my_theme/component/categories/category_card.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class WomenCategoriesTab extends StatefulWidget {
  const WomenCategoriesTab({super.key});

  @override
  State<WomenCategoriesTab> createState() => _WomenCategoriesTabState();
}

class _WomenCategoriesTabState extends State<WomenCategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          const CampaignCard(
            title: 'SUMMER SALES',
            subTitle: 'Up to %50 off',
          ),
          SizedBox(height: 16.v),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(height: 16.v),
            itemBuilder: (BuildContext context, int index) {
              return const CategoryCard(
                category: 'Clothes',
                imagePath: 'assets/png/clothes.png',
              );
            },
          ),
        ],
      ),
    );
  }
}
