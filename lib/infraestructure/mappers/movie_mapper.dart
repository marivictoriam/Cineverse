import 'package:cineverse/domain/entities/movie.dart';

class MovieMapper {
  static Movie movieDBToEntity(dynamic moviedb) => Movie(
        id: moviedb.id,
        posterPath: (moviedb.posterPath != '')
            ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
            : 'https://www.movienewz.com/img/films/poster-holder.jpg',
        title: moviedb.title,
        voteAverage: moviedb.voteAverage,
      );
}
