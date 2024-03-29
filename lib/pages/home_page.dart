import 'package:flutter/material.dart';
import 'package:news_app/components/category_list.dart';
import 'package:news_app/components/news_list_sliver_builder.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
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
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.amber,
                // fontWeight: FontWeight.bold,
                fontFamily: "Rowdies",
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            slivers: const [
              SliverToBoxAdapter(
                child: CategoryListView(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "Top general news",
                    style: TextStyle(
                      color: Colors.amber,
                      fontFamily: "Rowdies",
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  endIndent: 25,
                  indent: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              NewsListSliverBuilder(
                category: "",
              ),
              // SliverList.builder(
              //   itemCount: 5,
              //   itemBuilder: (context, index) {
              //     return Padding(
              //       padding: const EdgeInsets.only(
              //         bottom: 10,
              //       ),
              //       child: NewsCard(),
              //     );
              //   },
              // ),
            ],
          ),
          // child: ListView(
          //   physics: BouncingScrollPhysics(),
          //   children: [
          //     CategoryListView(categories: categories),
          //     SizedBox(
          //       height: 40,
          //     ),
          //     NewsListView(),
          //   ],
          // ),
        ),
      ),
    );
  }
}
