import 'package:equatable/equatable.dart';

abstract class MovieActorsEvent extends Equatable {
  const MovieActorsEvent();

  @override
  List<Object?> get props => [];
}

class LoadMovieActors extends MovieActorsEvent {
  final String movieId;

  const LoadMovieActors(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
