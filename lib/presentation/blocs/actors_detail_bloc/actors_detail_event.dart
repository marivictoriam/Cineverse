import 'package:equatable/equatable.dart';

abstract class ActorsDetailEvent extends Equatable {
  const ActorsDetailEvent();

  @override
  List<Object?> get props => [];
}

class LoadActor extends ActorsDetailEvent {
  final String actorId;

  const LoadActor(this.actorId);

  @override
  List<Object?> get props => [actorId];
}
