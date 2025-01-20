import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/infraestructure/models/moviedb/actor_moviedb.dart';

class ActorsMapper {
  static Actor responseToEntity(ActorMovieDb response) => Actor(
        id: response.id,
        name: response.name,
        profilePath: response.profilePath != null
            ? 'https://image.tmdb.org/t/p/w500${response.profilePath}'
            : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
      );
}
