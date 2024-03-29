import 'package:flutter/material.dart';
import 'package:news_app/components/news_card.dart';
import 'package:news_app/models/article_model.dart';

class NewsListSliver extends StatelessWidget {
  const NewsListSliver({
    super.key,
    required this.articles,
  });

  final List<ArticleModel> articles;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: NewsCard(
              articleModel: articles[index],
            ),
          );
        },
      ),
    );
  }
}
