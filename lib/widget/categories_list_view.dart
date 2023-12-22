import 'package:flutter/material.dart';
import 'package:news_cloud_app/models/category_model.dart';
import 'package:news_cloud_app/widget/category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/general.jpg', title: 'General'),
    CategoryModel(image: 'assets/technology.jpeg', title: 'Technology'),
    CategoryModel(image: 'assets/sports.jpg', title: 'Sports'),
    CategoryModel(image: 'assets/business.jpg', title: 'Business'),
    CategoryModel(image: 'assets/entertaiment.jpg', title: 'Entertainment'),
    CategoryModel(image: 'assets/science.jpg', title: 'Science'),
    CategoryModel(image: 'assets/health.jpg', title: 'Health'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(
            bottom: 10.0,
          ),
          child: CategoryCard(
            categoryModel: categories[index],
          ),
        ),
        itemCount: categories.length,
      ),
    );
  }
}
