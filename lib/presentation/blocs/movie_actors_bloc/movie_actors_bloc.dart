import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/presentation/blocs/movie_actors_bloc/movie_actors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MovieActorsBloc extends Bloc<MovieActorsEvent, MovieActorsState> {
  final dynamic getActors;

  MovieActorsBloc({required this.getActors}) : super(const MovieActorsState()) {
    on<LoadMovieActors>(_onLoadActors);
  }

  Future<void> _onLoadActors(
      LoadMovieActors event, Emitter<MovieActorsState> emit) async {
    if (state.actorsByMovie[event.movieId] == null) {
      emit(state.copyWith(isLoading: true));

      try {
        final List<Actor> actors = await getActors(event.movieId);

        emit(state.copyWith(
          actorsByMovie: {...state.actorsByMovie, event.movieId: actors},
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          actorsByMovie: state.actorsByMovie,
          isLoading: false,
        ));
      }
    } else if (state.actorsByMovie[event.movieId]!.isEmpty) {
      emit(state.copyWith(isLoading: true));

      try {
        final List<Actor> actors = await getActors(event.movieId);

        emit(state.copyWith(
          actorsByMovie: {...state.actorsByMovie, event.movieId: actors},
          isLoading: false,
        ));
      } catch (e) {
        emit(state.copyWith(
          actorsByMovie: state.actorsByMovie,
          isLoading: false,
        ));
      }
    } else {
      return;
    }
  }
}
