import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category_page.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryItem,
  });

  final CategoryModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return CategoryPage(
                category: categoryItem.category,
              );
            },
          ));
        },
        child: Container(
          alignment: Alignment.center,
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              opacity: .9,
              fit: BoxFit.fill,
              image: AssetImage(categoryItem.assetImage),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            categoryItem.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
