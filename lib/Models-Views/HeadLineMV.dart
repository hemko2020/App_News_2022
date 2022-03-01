import 'package:news_app/Models/Article_rep.dart';
import 'package:news_app/Services/NewsRepo.dart';
import 'package:rxdart/rxdart.dart';

class HeadLinesMV {
  final NewsRepo _repository = NewsRepo();
  final BehaviorSubject<ArticleRep> _subject = BehaviorSubject<ArticleRep>();

  headLinesMV() async {
    ArticleRep response = await _repository.getTopHeadlines();
    _subject.sink.add(response);
  }

  dipose() {
    _subject.close();
  }

  BehaviorSubject<ArticleRep> get subject => _subject;
}

final headLinesMV = HeadLinesMV();
