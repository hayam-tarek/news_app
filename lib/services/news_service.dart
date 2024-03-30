import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_app/models/article_model.dart';
//https://newsapi.org/

class NewsService {
  final Dio dio;
  NewsService({required this.dio});

  Future<List<ArticleModel>> getNews({required String category}) async {
    try {
      await dotenv.load(fileName: ".env");
      String apiKey = dotenv.env['API_KEY']!;
      final Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey&category=$category',
      );
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData["articles"];

      List<ArticleModel> articleList = [];
      for (var article in articles) {
        articleList.add(
          ArticleModel.fromJson(article: article),
        );
      }
      return articleList;
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      return [];
    }
  }
}
