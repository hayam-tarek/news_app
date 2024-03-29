import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/news_list_sliver.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';

class NewsListSliverBuilder extends StatefulWidget {
  final String category;
  const NewsListSliverBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsListSliverBuilder> createState() => _NewsListSliverBuilderState();
}

class _NewsListSliverBuilderState extends State<NewsListSliverBuilder> {
  // List<ArticleModel> articles = [];
  // bool isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   getNews();
  // }
  // Future<void> getNews() async {
  //   articles = await NewsService(dio: Dio()).getNews();
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

  var future;
  @override
  void initState() {
    future = NewsService(dio: Dio()).getNews(category: widget.category);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListSliver(
            articles: snapshot.data ?? [],
          );
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            child: Center(
              child: Image.asset(
                "images/error.png",
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
                child: CircularProgressIndicator(
              color: Colors.amber,
            )),
          );
        }
      },
    );
    // return isLoading
    //     ? SliverFillRemaining(
    //         child: Center(
    //             child: CircularProgressIndicator(
    //           color: Colors.amber,
    //         )),
    //       )
    //     : articles.isNotEmpty
    //         ? NewsListSliver(
    //             articles: articles,
    //           )
    //         : SliverFillRemaining(
    //             child: Center(
    //               child: Image.asset(
    //                 "images/error.png",
    //               ),
    //             ),
    //           );
  }
}
