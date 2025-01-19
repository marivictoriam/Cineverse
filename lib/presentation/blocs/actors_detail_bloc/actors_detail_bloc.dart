import 'package:cineverse/domain/entities/actor.dart';
import 'package:cineverse/presentation/blocs/actors_detail_bloc/actors_detail_event.dart';
import 'package:cineverse/presentation/blocs/actors_detail_bloc/actors_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsDetailBloc extends Bloc<ActorsDetailEvent, ActorsDetailState> {
  final dynamic getActor;

  ActorsDetailBloc({required this.getActor})
      : super(const ActorsDetailState()) {
    on<LoadActor>(_onLoadActors);
  }

  Future<void> _onLoadActors(
      LoadActor event, Emitter<ActorsDetailState> emit) async {
    if (state.actorsDetails[event.actorId] != null) return;

    emit(state.copyWith(isLoading: true));

    final Actor? actor = await getActor(event.actorId);

    emit(state.copyWith(
      actorsDetails: {...state.actorsDetails, event.actorId: actor},
      isLoading: false,
    ));
  }
}
