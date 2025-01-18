import 'package:cineverse/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie?>> getPopular({int page = 1});

  Future<List<Movie?>> getMoviesByActor(String actorID);
}
