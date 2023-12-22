import 'package:flutter/material.dart';
//import 'package:flutter_avif/flutter_avif.dart';
import 'package:news_cloud_app/models/category_model.dart';
import 'package:news_cloud_app/pages/category_view.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryCard({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategotryView(category: categoryModel.title),
          ),
        );
      },
      child: Container(
        height: 120,
        width: 200,
        margin: const EdgeInsets.only(right: 15.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(categoryModel.image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Text(
          categoryModel.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
