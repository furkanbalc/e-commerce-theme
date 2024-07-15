import 'package:flutter/material.dart';
import 'package:my_theme/component/categories/campaign_card.dart';
import 'package:my_theme/component/categories/category_card.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class MenCategoriesTab extends StatefulWidget {
  const MenCategoriesTab({super.key});

  @override
  State<MenCategoriesTab> createState() => _MenCategoriesTabState();
}

class _MenCategoriesTabState extends State<MenCategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          const CampaignCard(
            title: 'WINTER SALES',
            subTitle: 'Up to %40 off',
          ),
          SizedBox(height: 16.v),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(height: 16.v),
            itemBuilder: (BuildContext context, int index) {
              return const CategoryCard(
                category: 'Shoes',
                imagePath: 'assets/png/shoes.png',
              );
            },
          ),
        ],
      ),
    );
  }
}
