import 'package:equatable/equatable.dart';

abstract class ActorsMoviesEvent extends Equatable {
  const ActorsMoviesEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovie extends ActorsMoviesEvent {
  final String actorId;

  const LoadMovie(this.actorId);

  @override
  List<Object?> get props => [actorId];
}
