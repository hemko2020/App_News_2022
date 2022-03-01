import 'package:news_app/Models/Article_rep.dart';
import 'package:news_app/Services/NewsRepo.dart';
import 'package:rxdart/rxdart.dart';

class HotNews {
  final NewsRepo _repository = NewsRepo();
  final BehaviorSubject<ArticleRep> _subject = BehaviorSubject<ArticleRep>();

  hotNews() async {
    ArticleRep response = await _repository.getHotNews();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<ArticleRep> get subject => _subject;
}

final hotNews = HotNews();
