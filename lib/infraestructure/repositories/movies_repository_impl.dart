import 'package:cineverse/domain/datasources/movie_datasource.dart';
import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie?>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie?>> getMoviesByActor(String actorID) {
    return datasource.getMoviesByActor(actorID);
  }
}
