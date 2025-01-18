import 'package:equatable/equatable.dart';

abstract class ActorsEvent extends Equatable {
  const ActorsEvent();

  @override
  List<Object?> get props => [];
}

class LoadActors extends ActorsEvent {
  final String movieId;

  const LoadActors(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
