import 'package:cineverse/domain/entities/movie.dart';
import 'package:cineverse/presentation/blocs/actors_movies_bloc/actors_movies_event.dart';
import 'package:cineverse/presentation/blocs/actors_movies_bloc/actors_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsMoviesBloc extends Bloc<ActorsMoviesEvent, ActorsMoviesState> {
  final dynamic getActorsMovies;

  ActorsMoviesBloc({required this.getActorsMovies})
      : super(const ActorsMoviesState()) {
    on<LoadMovie>(_onLoadActors);
  }

  Future<void> _onLoadActors(
      LoadMovie event, Emitter<ActorsMoviesState> emit) async {
    if (state.actorsMovies[event.actorId] == null) {
      emit(state.copyWith(isLoading: true));

      final List<Movie> movies = await getActorsMovies(event.actorId);

      emit(state.copyWith(
        actorsDetails: {...state.actorsMovies, event.actorId: movies},
        isLoading: false,
      ));
    } else if (state.actorsMovies[event.actorId]!.isEmpty) {
      emit(state.copyWith(isLoading: true));

      final List<Movie> movies = await getActorsMovies(event.actorId);

      emit(state.copyWith(
        actorsDetails: {...state.actorsMovies, event.actorId: movies},
        isLoading: false,
      ));
    } else {
      return;
    }
  }
}
