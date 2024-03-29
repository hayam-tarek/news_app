import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.articleModel,
  });
  final ArticleModel articleModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            articleModel.image ??
                "https://img.freepik.com/free-vector/oops-404-error-with-broken-robot-concept-illustration_114360-5529.jpg?t=st=1711658587~exp=1711662187~hmac=f3258a9bf6c5b9dc5ea029a21522c62e06f0e93022433e3a2d5f611868b33760&w=900",
            height: 200,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          articleModel.title ?? "NULL",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          articleModel.subTitle ?? "",
          maxLines: 2,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }
}
