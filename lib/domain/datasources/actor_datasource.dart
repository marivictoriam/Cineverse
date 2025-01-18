import 'package:cineverse/domain/entities/actor.dart';

abstract class ActorsDatasource {
  Future<List<Actor?>> getActorsByMovie(String movieID);

  Future<Actor?> getActorDetail(String actorID);
}
