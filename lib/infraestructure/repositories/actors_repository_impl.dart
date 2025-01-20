import 'package:cineverse/domain/datasources/actor_datasource.dart';
import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);

  @override
  Future<List<Actor?>> getActorsByMovie(String movieID) {
    return datasource.getActorsByMovie(movieID);
  }

  @override
  Future<Actor?> getActorDetail(String actorID) {
    return datasource.getActorDetail(actorID);
  }

  @override
  Future<List<Actor?>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
}
