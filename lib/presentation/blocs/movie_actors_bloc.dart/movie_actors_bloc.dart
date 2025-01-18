import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/presentation/blocs/movie_actors_bloc.dart/movie_actors_event.dart';
import 'package:cineverse/presentation/blocs/movie_actors_bloc.dart/movie_actors_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsBloc extends Bloc<ActorsEvent, ActorsState> {
  final dynamic getActors;

  ActorsBloc({required this.getActors}) : super(const ActorsState()) {
    on<LoadActors>(_onLoadActors);
  }

  Future<void> _onLoadActors(
      LoadActors event, Emitter<ActorsState> emit) async {
    if (state.actorsByMovie[event.movieId] != null) return;

    emit(state.copyWith(isLoading: true));

    final List<Actor> actors = await getActors(event.movieId);

    emit(state.copyWith(
      actorsByMovie: {...state.actorsByMovie, event.movieId: actors},
      isLoading: false,
    ));
  }
}
