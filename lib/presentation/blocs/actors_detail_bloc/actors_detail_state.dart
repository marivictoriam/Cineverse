import 'package:cineverse/domain/entities/actor.dart';
import 'package:equatable/equatable.dart';

class ActorsDetailState extends Equatable {
  final Map<String, Actor?> actorsDetails;
  final bool isLoading;

  const ActorsDetailState({
    this.actorsDetails = const {},
    this.isLoading = false,
  });

  ActorsDetailState copyWith({
    Map<String, Actor?>? actorsDetails,
    bool? isLoading,
  }) {
    return ActorsDetailState(
      actorsDetails: actorsDetails ?? this.actorsDetails,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [actorsDetails, isLoading];
}
