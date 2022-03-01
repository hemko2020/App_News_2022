import 'package:news_app/Models/Source_rep.dart';
import 'package:news_app/Services/NewsRepo.dart';
import 'package:rxdart/subjects.dart';

class SourcesMViews {
  final NewsRepo _repository = NewsRepo();
  final BehaviorSubject<SourceRep> _subject = BehaviorSubject<SourceRep>();

  sourcesMV() async {
    SourceRep response = await _repository.getSources();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<SourceRep> get subject => _subject;
}

final sourcesMV = SourcesMViews();
