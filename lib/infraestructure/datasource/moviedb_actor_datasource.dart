import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/infraestructure/mappers/mappers.dart';
import 'package:cineverse/infraestructure/models/moviedb/models.dart';
import 'package:cineverse/domain/datasources/actor_datasource.dart';
import 'package:cineverse/config/environment.dart';

import 'package:dio/dio.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.tmdbApiKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor?>> getActorsByMovie(String movieID) async {
    try {
      final response = await dio.get('/movie/$movieID/credits');
      if (response.statusCode != 200) {
        throw Exception('Pelicula con ID: $movieID no fue encontrada');
      }

      // Modelo basado en la respuesta del query
      final creditsResponse = MovieCreditsResponse.fromJson(response.data);

      // Uso del mapper para tener una lista de Actores
      List<Actor> actors = creditsResponse.cast
          .map((cast) => CastMapper.castToEntity(cast))
          .take(3)
          .toList();

      return actors;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<Actor?> getActorDetail(String actorID) async {
    try {
      final response = await dio.get('/person/$actorID');
      if (response.statusCode != 200) {
        throw Exception('Actor con ID: $actorID no fue encontrado');
      }

      // Modelo basado en la respuesta del query
      final detailResponse = ActorDetailsResponse.fromJson(response.data);
      final Actor actor = ActorMapper.responseToEntity(detailResponse);
      return actor;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Actor?>> getPopular({int page = 1}) async {
    try {
      final response =
          await dio.get('/person/popular', queryParameters: {'page': page});

      final actorsDBResponse = ActoDbResponse.fromJson(response.data);

      // Uso del mapper para tener una lista de Actors
      final List<Actor> actors = actorsDBResponse.results
          .where((actordb) => actordb.name != '...')
          .map((actordb) => ActorsMapper.responseToEntity(actordb))
          .toList();

      return actors;
    } catch (e) {
      return [];
    }
  }
}
