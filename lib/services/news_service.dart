import 'package:dio/dio.dart';
import 'package:news_cloud_app/models/article_model.dart';

class NewService {
  final Dio dio;

  NewService(this.dio);

  Future<List<ArticlModel>> getNews({required String category}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?apikey=af254956664a4800850486c9faddae17&country=us&category=$category');
      Map<String, dynamic> jsonData = response.data;

      List<dynamic> articles = jsonData['articles'];

      // List<ArticlModel> articalList = articles
      //     .map(
      //       (e) => ArticlModel(
      //           image: e,
      //           description: articles[e]['description'],
      //           title: articles[e]['title']),
      //     )
      //     .toList();
      List<ArticlModel> articalList = [];

      for (var article in articles) {
        // ArticlModel articlModel = ArticlModel(
        //   image: article['urlToImage'],
        //   title: article['title'],
        //   description: article['description'],
        //   url: article['url'],
        // );
        ArticlModel articlModel = ArticlModel.fromJson(article);
        articalList.add(articlModel);
      }

      return articalList;
    } catch (error) {
      return [];
    }
  }
}
