import 'package:flutter/material.dart';
import 'package:news_cloud_app/models/article_model.dart';
import 'package:news_cloud_app/widget/news_tile.dart';

class NewsListView extends StatelessWidget {
  final List<ArticlModel> articles;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: NewsTile(articleModel: articles[index]),
      ),
      itemCount: articles.length,
    );
  }
}

// ListView.builder(
//       shrinkWrap: true,  ----> to build all items
//       physics: const NeverScrollableScrollPhysics(), ---> because the CustomScrollView widget will scrolling the screen
//       itemBuilder: (context, index) => const Padding(
//         padding: EdgeInsets.only(bottom: 15),
//         child: NewsTile(),
//       ),
//       itemCount: 10,
//     );
