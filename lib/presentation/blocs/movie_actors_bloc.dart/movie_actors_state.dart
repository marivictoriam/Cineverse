import 'package:cineverse/domain/entities/actor.dart';
import 'package:equatable/equatable.dart';

class ActorsState extends Equatable {
  final Map<String, List<Actor>> actorsByMovie;
  final bool isLoading;

  const ActorsState({
    this.actorsByMovie = const {},
    this.isLoading = false,
  });

  ActorsState copyWith({
    Map<String, List<Actor>>? actorsByMovie,
    bool? isLoading,
  }) {
    return ActorsState(
      actorsByMovie: actorsByMovie ?? this.actorsByMovie,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [actorsByMovie, isLoading];
}
