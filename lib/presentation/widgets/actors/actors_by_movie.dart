import 'package:cineverse/presentation/blocs/movie_actors_bloc.dart/movie_actors_bloc.dart';
import 'package:cineverse/presentation/blocs/movie_actors_bloc.dart/movie_actors_state.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActorsByMovie extends StatelessWidget {
  final String movieId;

  const ActorsByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActorsBloc, ActorsState>(
      builder: (context, state) {
        final actors = state.actorsByMovie[movieId] ?? [];

        if (state.isLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        }

        if (actors.isEmpty) {
          return const Center(child: Text("No se encontraron sus actores"));
        }

        return SizedBox(
          height: 260,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: actors.length,
            itemBuilder: (context, index) {
              final actor = actors[index];

              return Container(
                padding: const EdgeInsets.all(8.0),
                width: 135,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInRight(
                      child: GestureDetector(
                        onTap: () {
                          // actor.id
                        },
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Stack(
                              children: [
                                FadeInImage(
                                  height: 200,
                                  width: 135,
                                  fit: BoxFit.cover,
                                  placeholder:
                                      const AssetImage('assets/loader.jpg'),
                                  image: NetworkImage(
                                    actor.profilePath,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.all(1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          actor.name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        Text(
                                          actor.character ?? '',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
