import 'package:flutter/material.dart';
import 'package:news_app/components/news_list_sliver_builder.dart';

class CategoryPage extends StatelessWidget {
  final ScrollController scrollController = ScrollController();

  final String category;
  CategoryPage({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          scrollController.animateTo(
            0,
            duration: const Duration(seconds: 3),
            curve: Curves.ease,
          );
        },
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.move_up_rounded,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          category,
          style: const TextStyle(
            color: Colors.amber,
            fontFamily: "Rowdies",
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.amber,
            size: 30,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: [
              NewsListSliverBuilder(
                category: category,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
