import 'package:cineverse/domain/entities/movie.dart';

class MoviesState {
  final List<Movie> movies;
  final int currentPage;
  final bool isLoading;

  MoviesState({
    required this.movies,
    required this.currentPage,
    required this.isLoading,
  });

  MoviesState copyWith({
    List<Movie>? movies,
    int? currentPage,
    bool? isLoading,
  }) {
    return MoviesState(
      movies: movies ?? this.movies,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
