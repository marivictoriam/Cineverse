import 'package:cineverse/domain/entities/actor.dart';

abstract class ActorsRepository {
  Future<List<Actor?>> getActorsByMovie(String movieID);

  Future<Actor?> getActorDetail(String actorID);
}
