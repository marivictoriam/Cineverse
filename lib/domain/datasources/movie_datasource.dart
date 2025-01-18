import 'package:cineverse/domain/entities/movie.dart';

abstract class MovieDatasource {
  Future<List<Movie?>> getPopular({int page = 1});

  Future<List<Movie?>> getMoviesByActor(String actorID);
}
