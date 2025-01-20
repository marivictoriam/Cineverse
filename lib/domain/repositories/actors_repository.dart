import 'package:cineverse/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor?>> getActorsByMovie(String movieID);

  Future<Actor?> getActorDetail(String actorID);

  Future<List<Actor?>> getPopular({int page = 1});
}
