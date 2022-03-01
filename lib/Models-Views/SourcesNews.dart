import 'package:flutter/material.dart';
import 'package:news_app/Models/Article_rep.dart';
import 'package:news_app/Services/NewsRepo.dart';
import 'package:rxdart/subjects.dart';

class SourcesNews {
  final NewsRepo _repository = NewsRepo();
  final BehaviorSubject<ArticleRep> _subject = BehaviorSubject<ArticleRep>();

  sourcesNews(String sourceId) async {
    ArticleRep response = await _repository.getSourceNews(sourceId);
    _subject.sink.add(response);
  }

  void takeStream() {
    _subject.value == null;
  }

  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<ArticleRep> get subject => _subject;
}

final sourcesNews = SourcesNews();
