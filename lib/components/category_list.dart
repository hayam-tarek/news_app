import 'package:flutter/material.dart';
import 'package:news_app/components/category_card.dart';
import 'package:news_app/models/category_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    super.key,
  });

  final List<CategoryModel> categories = const <CategoryModel>[
    CategoryModel(
        assetImage: "images/business.jpg",
        title: "Business",
        category: "business"),
    CategoryModel(
        assetImage: "images/entertainment.jpg",
        title: "Entertainment",
        category: "entertainment"),
    CategoryModel(
      assetImage: "images/health.jpg",
      title: "Health",
      category: "health",
    ),
    CategoryModel(
        assetImage: "images/science.jpg",
        title: "Science",
        category: "science"),
    CategoryModel(
      assetImage: "images/sports.jpg",
      title: "Sports",
      category: "sports",
    ),
    CategoryModel(
        assetImage: "images/technology.jpg",
        title: "Technology",
        category: "technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(
            categoryItem: categories[index],
          );
        },
      ),
    );
  }
}
