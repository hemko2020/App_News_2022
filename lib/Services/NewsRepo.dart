import 'dart:core';
import 'package:dio/dio.dart';
import 'package:news_app/Models/Source_rep.dart';
import '../Models/Article_rep.dart';

class NewsRepo {
  static String mainUrl = "https://newsapi.org/v2/";
  final String apiKey = "6e109140efd34a0d805afe229f95f4b4";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadlinesUrl = "$mainUrl/top-headlines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceRep> getSources() async {
    var params = {"apiKey": apiKey, "language": "en", "country": "us"};
    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceRep.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceRep.withError("$error");
    }
  }

  Future<ArticleRep> getTopHeadlines() async {
    var params = {"apiKey": apiKey, "country": "us"};
    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleRep.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleRep.withError("error");
    }
  }

  Future<ArticleRep> search(String value) async {
    var params = {"apiKey": apiKey, "q": value, "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleRep.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ArticleRep.withError("$error");
    }
  }

  Future<ArticleRep> getHotNews() async {
    var params = {"apiKey": apiKey, "q": "apple", "sortBy": "popularity"};
    try {
      Response response =
          await _dio.get(everythingUrl, queryParameters: params);
      return ArticleRep.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTtrace: $stacktrace");
      return ArticleRep.withError("$error");
    }
  }

  Future<ArticleRep> getSourceNews(String sourceId) async {
    var params = {"apiKey": apiKey, "sources": sourceId};
    try {
      Response response =
          await _dio.get(getTopHeadlinesUrl, queryParameters: params);
      return ArticleRep.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTtrace: $stacktrace");
      return ArticleRep.withError("$error");
    }
  }
}
