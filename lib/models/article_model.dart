class ArticleModel {
  final String? image;
  final String? title;
  final String? subTitle;
  final String url;

  const ArticleModel({
    required this.image,
    required this.title,
    required this.subTitle,
    required this.url,
  });
  factory ArticleModel.fromJson({required article}) {
    return ArticleModel(
      image: article["urlToImage"],
      title: article["title"],
      subTitle: article["description"],
      url: article["url"],
    );
  }
}
