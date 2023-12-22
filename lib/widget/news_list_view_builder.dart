import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_cloud_app/models/article_model.dart';
import 'package:news_cloud_app/services/news_service.dart';
import 'package:news_cloud_app/widget/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  final String category;
  const NewsListViewBuilder({
    super.key,
    required this.category,
  });

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;

  @override
  void initState() {
    super.initState();
    future = NewService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticlModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 5.0,
              child: Text(
                'Opps, There is an error. We will fix it ASAP',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(
              heightFactor: 15.0,
              child: CircularProgressIndicator(
                semanticsLabel: 'Loading',
                semanticsValue: 'Loading',
                strokeAlign: 12,
                strokeWidth: 10,
                color: Colors.amber,
                backgroundColor: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}

// List<ArticlModel> articles = [];

  // bool isLoading = true;
  // @override
  // void initState() {
  //   super.initState();
  //   //------------
  //   getGeneralNews();
  // }

  // Future<void> getGeneralNews() async {
  //   articles = await NewService(Dio()).getNews();
  //   isLoading = false;
  //   setState(() {});
  // }

      // return isLoading
    //     ? const SliverToBoxAdapter(
    //         child: Center(
    //           heightFactor: 15.0,
    //           child: CircularProgressIndicator(
    //             semanticsLabel: 'Loading',
    //             strokeAlign: 12,
    //             strokeWidth: 10,
    //             color: Colors.amber,
    //             backgroundColor: Colors.black,
    //           ),
    //         ),
    //       )
    //     : articles.isNotEmpty
    //         ? NewsListView(
    //             articles: articles,
    //           )
    //         : const SliverToBoxAdapter(
    //             child: Center(
    //               heightFactor: 5.0,
    //               child: Text(
    //                 'Opps, There is an error. We will fix it ASAP',
    //                 style: TextStyle(
    //                   fontSize: 25,
    //                 ),
    //               ),
    //             ),
    //           );