import 'package:cineverse/infraestructure/models/moviedb/actor_credits_response.dart';
import 'package:dio/dio.dart';

import 'package:cineverse/config/environment.dart';
import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/infraestructure/mappers/movie_mapper.dart';
import 'package:cineverse/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cineverse/domain/datasources/movie_datasource.dart';

class MoviedbDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.tmdbApiKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie?>> getPopular({int page = 1}) async {
    try {
      final response =
          await dio.get('/movie/popular', queryParameters: {'page': page});

      final movieDBResponse = MovieDbResponse.fromJson(response.data);

      // Uso del mapper para tener una lista de Movies
      final List<Movie> movies = movieDBResponse.results
          .where((moviedb) => moviedb.title != 'No hay titulo')
          .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
          .toList();

      return movies;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Movie?>> getMoviesByActor(String actorID) async {
    try {
      final response = await dio.get('/person/$actorID/credits');
      if (response.statusCode != 200) {
        throw Exception('Actor con ID: $actorID no fue encontrado');
      }

      final creditsResponse = ActorCreditsResponse.fromJson(response.data);

      List<Movie> movies = creditsResponse.cast
          .map((cast) => MovieMapper.movieDBToEntity(cast))
          .toList();

      return movies;
    } catch (e) {
      return [];
    }
  }
}
