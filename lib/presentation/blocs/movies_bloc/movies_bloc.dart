import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/blocs/movies_bloc/movies_event.dart';
import 'package:cineverse/presentation/blocs/movies_bloc/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final dynamic fetchMoreMovies;

  MoviesBloc({required this.fetchMoreMovies})
      : super(MoviesState(movies: [], currentPage: 0, isLoading: false)) {
    on<LoadNextPage>(_onLoadNextPage);
  }

  Future<void> _onLoadNextPage(
      LoadNextPage event, Emitter<MoviesState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    final nextPage = state.currentPage + 1;
    final List<Movie> newMovies = await fetchMoreMovies(page: nextPage);

    emit(state.copyWith(
      movies: [...state.movies, ...newMovies],
      currentPage: nextPage,
      isLoading: false,
    ));
  }
}
