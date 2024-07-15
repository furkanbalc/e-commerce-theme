import 'package:flutter/material.dart';
import 'package:my_theme/component/custom_card.dart';
import 'package:my_theme/component/custom_text.dart';
import 'package:my_theme/core/utils/size_utils.dart';
import 'package:my_theme/screens/categories/sub_categories.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.imagePath,
  });

  final String category;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SubCategoriesView()));
      },
      child: CustomCard(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.v),
                child: CustomText(text: category, fontSize: 18.fSize, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(child: Image.asset(imagePath, fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }
}
