import 'package:cineverse/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieDbResponse {
  MovieDbResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieMovieDB> results;
  final int totalPages;
  final int totalResults;

  factory MovieDbResponse.fromJson(Map<String, dynamic> json) =>
      MovieDbResponse(
        page: json["page"],
        results: List<MovieMovieDB>.from(
            json["results"].map((x) => MovieMovieDB.fromJson(x))),
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
