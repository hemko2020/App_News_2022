import 'package:news_app/Models/Source.dart';

class SourceRep {
  final List<Source> sources;
  final String error;

  SourceRep(this.sources, this.error);

  SourceRep.fromJson(Map<String, dynamic> json)
      : sources =
            (json["sources"] as List).map((i) => Source.fromJson(i)).toList(),
        error = "";

  SourceRep.withError(
    String errorValue,
  )   : sources = [],
        error = errorValue;
}
