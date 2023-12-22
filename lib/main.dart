import 'package:flutter/material.dart';
import 'package:news_cloud_app/pages/home_page.dart';

void main() {
  //NewService(Dio()).getNews();
  runApp(const NewsCloudApp());
}

class NewsCloudApp extends StatelessWidget {
  const NewsCloudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
