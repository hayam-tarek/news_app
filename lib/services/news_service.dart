import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=4835096eb88948a595f49055c82ca494&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articleList = [];
      for (var article in articles) {
        articleList.add(
          ArticleModel(
            image: article["urlToImage"],
            title: article["title"],
            subTitle: article["description"],
          ),
        );
      }
      return articleList;
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return [];
    }
  }
}
