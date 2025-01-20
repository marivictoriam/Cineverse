import 'package:cineverse/presentation/blocs/blocs.dart';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ActorsByMovie extends StatelessWidget {
  final String movieId;

  const ActorsByMovie({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieActorsBloc, MovieActorsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
              child: SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Color.fromARGB(255, 26, 26, 26),
            ),
          ));
        }

        final actors = state.actorsByMovie[movieId] ?? [];

        if (actors.isEmpty) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  const FadeInImage(
                    height: 200,
                    width: 135,
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/loader.jpg'),
                    image: AssetImage('assets/loader.jpg'),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      child: const Text(
                        "Ocurrio un error",
                        style: TextStyle(
                            color: Color.fromARGB(255, 49, 49, 49),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ));
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
                        onTap: () => context.push('/actor/${actor.id}'),
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
