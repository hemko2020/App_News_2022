// To parse this JSON data, do
//
//     final carouselData = carouselDataFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison

import 'dart:convert';

CarouselData carouselDataFromJson(String str) =>
    CarouselData.fromJson(json.decode(str));

String carouselDataToJson(CarouselData data) => json.encode(data.toJson());

class CarouselData {
  CarouselData({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory CarouselData.fromJson(Map<String, dynamic> json) => CarouselData(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    required this.title,
    required this.urlToImage,
  
  });

  String title;
  String urlToImage;
 

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        title: json["title"],
        urlToImage: json["urlToImage"],
       
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "urlToImage": urlToImage,
      };
}

class Source {
  Source({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}
