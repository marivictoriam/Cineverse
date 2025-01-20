import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/presentation/blocs/actors_bloc/actors.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsBloc extends Bloc<ActorsEvent, ActorsState> {
  final dynamic fetchMoreActors;

  ActorsBloc({required this.fetchMoreActors})
      : super(ActorsState(actors: [], currentPage: 0, isLoading: false)) {
    on<LoadANextPage>(_onLoadNextPage);
  }

  Future<void> _onLoadNextPage(
      LoadANextPage event, Emitter<ActorsState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true));

    try {
      final nextPage = state.currentPage + 1;
      final List<Actor> newActors = await fetchMoreActors(page: nextPage);

      emit(state.copyWith(
        actors: [...state.actors, ...newActors],
        currentPage: nextPage,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        actors: state.actors,
        currentPage: state.currentPage,
        isLoading: false,
      ));
    }
  }
}
