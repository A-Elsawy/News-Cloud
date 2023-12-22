import 'package:flutter/material.dart';
import 'package:news_cloud_app/widget/categories_list_view.dart';
import 'package:news_cloud_app/widget/news_list_view_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'News',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              'Cloud',
              style: TextStyle(
                color: Colors.amber,
              ),
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            NewsListViewBuilder(category: 'general'),
          ],
        ),
        // child: Column(
        //   children: [
        //     CategoriesListView(),
        //     Expanded(
        //       child: NewsListView(),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
