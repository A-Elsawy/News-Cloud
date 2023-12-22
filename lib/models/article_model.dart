class ArticlModel {
  final String? image;
  final String title;
  final String? description;
  final String? url;

  const ArticlModel(
      {required this.image,
      required this.title,
      required this.description,
      required this.url});

  factory ArticlModel.fromJson(json) {
    return ArticlModel(
      image: json['urlToImage'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
    );
  }
}
