import 'package:cineverse/domain/entities/actor.dart';
import 'package:equatable/equatable.dart';

class MovieActorsState extends Equatable {
  final Map<String, List<Actor>> actorsByMovie;
  final bool isLoading;

  const MovieActorsState({
    this.actorsByMovie = const {},
    this.isLoading = false,
  });

  MovieActorsState copyWith({
    Map<String, List<Actor>>? actorsByMovie,
    bool? isLoading,
  }) {
    return MovieActorsState(
      actorsByMovie: actorsByMovie ?? this.actorsByMovie,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [actorsByMovie, isLoading];
}
