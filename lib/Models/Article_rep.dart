import 'package:news_app/Models/ArticleData.dart';

class ArticleRep {
  final List<ArticleData> articles;
  final String error;

  ArticleRep(this.articles, this.error);

  ArticleRep.fromJson(Map<String, dynamic> json)
      : articles = (json["articles"] as List)
            .map((i) => ArticleData.fromJson(i))
            .toList(),
        error = "";

  ArticleRep.withError(String errorValue)
      : articles = [],
        error = errorValue;
}
