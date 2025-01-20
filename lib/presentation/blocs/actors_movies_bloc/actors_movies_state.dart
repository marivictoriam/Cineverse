import 'package:cineverse/domain/entities/movie.dart';
import 'package:equatable/equatable.dart';

class ActorsMoviesState extends Equatable {
  final Map<String, List<Movie>> actorsMovies;
  final bool isLoading;

  const ActorsMoviesState({
    this.actorsMovies = const {},
    this.isLoading = false,
  });

  ActorsMoviesState copyWith({
    Map<String, List<Movie>>? actorsDetails,
    bool? isLoading,
  }) {
    return ActorsMoviesState(
      actorsMovies: actorsDetails ?? this.actorsMovies,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [actorsMovies, isLoading];
}
