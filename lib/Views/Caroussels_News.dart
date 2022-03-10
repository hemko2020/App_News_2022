// ignore_for_file: prefer_is_empty, avoid_single_cascade_in_expression_statements, unnecessary_null_comparison, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Models/ArticleData.dart';
import 'package:news_app/Services/Error.dart';
import 'package:news_app/Services/Loading.dart';

import '../Models-Views/HeadLineMV.dart';
import '../Models/Article_rep.dart';

class CarousselPage extends StatefulWidget {
  @override
  _CarousselPageState createState() => _CarousselPageState();
}

class _CarousselPageState extends State<CarousselPage> {
  @override
  void initState() {
    super.initState();
    headLinesMV..headLinesMV();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: headLinesMV.subject.stream,
        builder: (context, AsyncSnapshot<ArticleRep> snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data!.error.length > 0) {
              return buildErrorWidget(snapshot.data!.error);
            }
            return _carousselSlider(snapshot.data!);
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.data!.error);
          } else {
            return buildLoadingWidget();
          }
        });
  }

  Widget _carousselSlider(ArticleRep data) {
    List<ArticleData> article = data.articles;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: false,
          height: 200,
          viewportFraction: 0.9,
        ),
        items: getSlider(article),
      ),
    );
  }

  getSlider(List<ArticleData> articles) {
    return articles.map(
      (article) => GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(
            right: 5,
            left: 5,
            top: 10,
            bottom: 10,
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("news_app/asset/images/2.jpeg"))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
