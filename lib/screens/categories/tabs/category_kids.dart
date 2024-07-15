import 'package:flutter/material.dart';
import 'package:my_theme/component/categories/campaign_card.dart';
import 'package:my_theme/component/categories/category_card.dart';
import 'package:my_theme/core/utils/size_utils.dart';

class KidsCategoriesTab extends StatefulWidget {
  const KidsCategoriesTab({super.key});

  @override
  State<KidsCategoriesTab> createState() => _KidsCategoriesTabState();
}

class _KidsCategoriesTabState extends State<KidsCategoriesTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.h),
      child: Column(
        children: [
          const CampaignCard(
            title: 'SCHOOL SALES',
            subTitle: 'Up to %100 off',
          ),
          SizedBox(height: 16.v),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => SizedBox(height: 16.v),
            itemBuilder: (BuildContext context, int index) {
              return const CategoryCard(
                category: 'Trousers',
                imagePath: 'assets/png/trousers.png',
              );
            },
          ),
        ],
      ),
    );
  }
}
