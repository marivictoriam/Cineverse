import 'package:cineverse/domain/entities/actor.dart';

class ActorsState {
  final List<Actor> actors;
  final int currentPage;
  final bool isLoading;

  ActorsState({
    required this.actors,
    required this.currentPage,
    required this.isLoading,
  });

  ActorsState copyWith({
    List<Actor>? actors,
    int? currentPage,
    bool? isLoading,
  }) {
    return ActorsState(
      actors: actors ?? this.actors,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
