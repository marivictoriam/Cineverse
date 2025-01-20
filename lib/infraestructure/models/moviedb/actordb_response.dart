import 'package:cineverse/infraestructure/models/moviedb/actor_moviedb.dart';

class ActoDbResponse {
  int page;
  List<ActorMovieDb> results;
  int totalPages;
  int totalResults;

  ActoDbResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory ActoDbResponse.fromJson(Map<String, dynamic> json) => ActoDbResponse(
        page: json["page"],
        results: List<ActorMovieDb>.from(
            json["results"].map((x) => ActorMovieDb.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
